CREATE TABLE reviste (
    id serial PRIMARY KEY,
    titlu VARCHAR(100) NOT NULL,
    tematici VARCHAR(100) NOT NULL,
    aparitie VARCHAR(100) NOT NULL,
    pret INT NOT NULL,
    numar_pagini INT NOT NULL
);

INSERT INTO reviste (titlu, tematici, aparitie, pret, numar_pagini)
VALUES ('Sport', 'sport/timp liber', 'lunara', 17, 38),
('Super-pisica', 'benzi desenate/copii/supereroi', 'saptamanala', 10, 30),
('Vruum Vrruumm', 'masini/motociclete/sport/timp liber', 'bilunara',25, 42),
('Fotbal în acțiune', 'sport', 'semestriala', 48,70),
('Castele minunate', 'turism/timp liber/arta', 'anuala', 80,100),
('Traditii in sport', 'sport/turism', 'lunara',18,34),
('Banditii si super-soricelul', 'benzi desenate/supereroi/copii', 'saptamanala', 14,44),
('Stiinta', 'stiinta/tehnica/viitor', 'lunara',25,60),
('Stiinta calculatoarelor', 'tehnica/calculatoare/stiinta', 'bilunara', 9, 22),
('Micul programator', 'copii/calculatoare', 'lunara', 18, 38),
('Motor-fani', 'motociclete/tehnica', 'anuala',70,130),
('Jocuri pentru copii', 'copii/timp liber', 'anuala',23,50),
('Tehnica', 'tehnica/viitor', 'lunara',30,70),
('Lumea dinozaurilor', 'stiinta/copii', 'anuala',34, 74),
('Alergând prin lume', 'sport/turism', 'anuala',19,40),
('Pictura moderna', 'arta', 'lunara',28, 50);

