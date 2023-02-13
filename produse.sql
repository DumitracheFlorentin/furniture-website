DROP TYPE IF EXISTS categorie_mare;
DROP TYPE IF EXISTS categorie_secundara;

CREATE TYPE categorie_mare AS ENUM('bucatarie', 'baie', 'sufragerie', 'dormitor');
CREATE TYPE categorie_secundara AS ENUM('culoare', 'material', 'stil', 'dimensiune', 'mobila');
CREATE TYPE culori AS ENUM ('rosu', 'verde', 'albastru', 'negru', 'alb', 'maro');


CREATE TABLE IF NOT EXISTS products (
   id serial PRIMARY KEY,
   nume VARCHAR(50) UNIQUE NOT NULL,
   descriere TEXT,
   imagine VARCHAR(300), 
   categorie categorie_mare DEFAULT 'bucatarie',
   tip_produs categorie_secundara DEFAULT 'material',
   pret NUMERIC(8,2) NOT NULL,
   garantie INTEGER NOT NULL,
   data_adaugare TIMESTAMP DEFAULT current_timestamp,
   culoare culori NOT NULL,
   materiale VARCHAR [],
   personalizabil BOOLEAN NOT NULL DEFAULT FALSE
);

INSERT INTO products (nume, descriere, imagine, pret, garantie, culoare, materiale, personalizabil)
VALUES ('Scaun Birou Elegant', 'Scaun de birou cu spatar inalt si sezut moale', 'https://example.com/scaun_birou_elegant.png', 199.99, 12, 'negru', '{piele sintetica, otel vopsit}', TRUE);

INSERT INTO products (nume, descriere, imagine, pret, garantie, culoare, materiale, personalizabil)
VALUES ('Masuta Cafea Retro', 'Masuta de cafea cu design retro si picioare din fier forjat', 'https://example.com/masuta_cafea_retro.png', 149.99, 12, 'negru', '{lemn masiv, fier forjat}', FALSE);

INSERT INTO products (nume, descriere, imagine, pret, garantie, culoare, materiale, personalizabil)
VALUES ('Canapea Chesterfield', 'Canapea cu design clasic Chesterfield', 'https://example.com/canapea_chesterfield.png', 999.99, 24, 'negru', '{piele naturala, otel vopsit}', FALSE);

INSERT INTO products (nume, descriere, imagine, pret, garantie, culoare, materiale, personalizabil)
VALUES ('Birou Executiv', 'Birou executiv cu sertare si compartimente pentru depozitare', 'https://example.com/birou_executiv.png', 799.99, 12, 'negru', '{lemn masiv, otel vopsit}', FALSE);

INSERT INTO products (nume, descriere, imagine, pret, garantie, culoare, materiale, personalizabil)
VALUES ('Set Mobila Gradina', 'Set de mobilier pentru gradina cu masa si scaune', 'https://example.com/set_mobila_gradina.png', 599.99, 12, 'rosu', '{plastic, aluminiu vopsit}', FALSE);

INSERT INTO products (nume, descriere, imagine, pret, garantie, culoare, materiale, personalizabil)
VALUES ('Lampa Birou Moderna', 'Lampa de birou cu design modern si finisaj cromat', 'https://example.com/lampa_birou_moderna.png', 89.99, 12, 'rosu', '{otel cromat, sticla}', FALSE);

INSERT INTO products (nume, descriere, imagine, pret, garantie, culoare, materiale, personalizabil)
VALUES ('Pat King Size 2', 'Pat king size cu cadru din lemn masiv', 'https://example.com/pat_king_size.png', 799.99, 24, 'rosu', '{lemn masiv, piele ecologica}', FALSE);

INSERT INTO products (nume, descriere, imagine, categorie, tip_produs, pret, garantie, culoare, materiale, personalizabil)
VALUES ('Scaun Birou', 'Scaun confortabil pentru birou, cu suport lombar si brate reglabile', 'https://example.com/scaun_birou.png', 'sufragerie', 'mobila', 99.99, 12, 'negru', '{"piele sintetica", "otel"}', true);

INSERT INTO products (nume, descriere, imagine, categorie, tip_produs, pret, garantie, culoare, materiale, personalizabil)
VALUES ('Canapea Living', 'Canapea de dimensiuni mari, cu perne pufoase si husa detasabila', 'https://example.com/canapea_living.png', 'sufragerie', 'mobila', 399.99, 24, 'alb', '{"poliester", "spuma"}', true);

INSERT INTO products (nume, descriere, imagine, categorie, tip_produs, pret, garantie, culoare, materiale, personalizabil)
VALUES ('Birou Computer', 'Birou pentru computer cu compartimente pentru stocare', 'https://example.com/birou_computer.png', 'bucatarie', 'mobila', 249.99, 18, 'alb', '{"PFL", "otel"}', false);

INSERT INTO products (nume, descriere, imagine, categorie, tip_produs, pret, garantie, culoare, materiale, personalizabil)
VALUES ('Set Masa si Scaune', 'Set de masa si scaune din lemn de fag, pentru bucatarie sau gradina', 'https://example.com/set_masa_scaune.png', 'bucatarie', 'mobila', 299.99, 12, 'maro', '{"lemn de fag", "otel"}', false);

INSERT INTO products (nume, descriere, imagine, categorie, tip_produs, pret, garantie, culoare, materiale, personalizabil)
VALUES ('Pat King Size', 'Pat king size cu saltea confortabila si sertare pentru depozitare', 'https://example.com/pat_king_size.png', 'dormitor', 'mobila', 499.99, 36, 'alb', '{"poliester", "spuma"}', false);

INSERT INTO products (nume, descriere, imagine, categorie, tip_produs, pret, garantie, culoare, materiale, personalizabil)
VALUES ('Fotoliu Puf', 'Fotoliu puf cu husa detasabila si umplutura moale', 'https://example.com/fotoliu_puf.png', 'sufragerie', 'mobila', 99.99, 12, 'rosu', '{"poliester", "pene"}', true);

INSERT INTO products (nume, descriere, imagine, categorie, tip_produs, pret, garantie, culoare, materiale, personalizabil)
VALUES ('Canapea extensibila', 'Canapea extensibila cu 2 locuri, culoare gri', 'https://example.com/canapea_extensibila.png', 'sufragerie', 'mobila', 999.99, 12, 'alb', '{lemn, plasa, poliester}', TRUE);