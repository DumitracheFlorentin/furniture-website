const express = require("express")
const fs = require("fs")
const sharp = require('sharp');

app = express()

app.set("view engine","ejs")

app.use("/resurse", express.static(__dirname + "/resurse"))

var getErrors = null
var getImages = null

function createImages () {
  const file = fs.readFileSync(__dirname + "/resurse/data/galerie.json").toString("utf8")
  const parsedObj = JSON.parse(file)
  const medium_sizes = 200
  const phone_sizes = 100
  const nrOfImgs = 13
  const month = ["January","February","March","April","May","June","July","August","September","October","November","December"];
  const d = new Date();
  const name = month[d.getMonth()];

  getImages = parsedObj.images  

  getImages.forEach(elem => {
      [img_name, extension] = elem.path_name.split(".")
      if(!fs.existsSync(parsedObj.path + "/medium/")){
        fs.mkdirSync(parsedObj.path+"/medium/")
      }

      if(!fs.existsSync(parsedObj.path + "/phone/")){
        fs.mkdirSync(parsedObj.path+"/phone/")
      }

      elem.path_name_medium = parsedObj.path + "/medium/" + img_name + ".webp"
      elem.path_name_phone = parsedObj.path + "/phone/" + img_name + ".webp"
      elem.path_name = parsedObj.path + "/" + elem.path_name

      sharp(__dirname + "/" + elem.path_name).resize(medium_sizes).toFile(__dirname + "/" + elem.path_name_medium)
      sharp(__dirname + "/" + elem.path_name).resize(phone_sizes).toFile(__dirname + "/" + elem.path_name_phone)
    })

    getImages = getImages.filter(img => {
      if(["December", "January", "February"].includes(name)) {
        return img.season == 'winter'
      }
      else if(["March", "April", "May"].includes(name)) {
        return img.season == 'spring'
      }
      else if(["June","July","August"].includes(name)) {
        return img.season == 'summer'
      }
      else {
        return img.season == 'autumn'
      }
    })

    while(getImages.length > nrOfImgs) {
      getImages.pop()
    }
}

createImages()

function createErrors () {
  getErrors = JSON.parse(fs.readFileSync(__dirname + "/resurse/data/errors.json").toString("utf8"))
}

createErrors()

function renderError (res, statusCode, title, label, img) {
  let findError = getErrors.errors.find((error) => error.statusCode === statusCode)

  title = title || (findError && findError.title) || getErrors.default.title
  label= label || (findError && findError.label) || getErrors.default.label
  img = img || (getErrors && getErrors.img_path + "/" + findError.img) || getErrors.img_path + "/" + getErrors.default.img

  if(findError && findError.status){
    res.status(statusCode).render("pagini/error", { title:title, label:label, img:img })
  } else {
    res.render("pagini/error", { title:title, label:label, img:img });
  }
}

app.get(["/","/index","/home"], (req, res) => {
  res.render("pagini/index", { ip: req.ip, images: getImages })
})

app.get("/*.ejs",function(req, res){
  renderError(res, 403);
});

app.get("/*", (req, res) => {
  res.render("pagini" + req.url, (error, response) => {
    if(error && error.message.includes("Failed to lookup view")){
      renderError(res, 404)
    }
    else{
      res.send(response)
    }
  })
})

app.listen(8080, () => {
  console.log("Server is running...")
})
