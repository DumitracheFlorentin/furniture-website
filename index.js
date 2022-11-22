const express = require("express")
const fs = require("fs")
app = express()

app.set("view engine","ejs")

app.use("/resurse", express.static(__dirname + "/resurse"))

var getErrors = null

function createErrors() {
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
  res.render("pagini/index", { ip: req.ip })
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
