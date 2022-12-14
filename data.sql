INSERT INTO animals (
    name, 
    date_of_birth, 
    weight_kg, 
    neutered,
    escape_attempts) 
VALUES 
('Agumon', DATE '2020 02 03', 10.23, true, 0),
('Gabumon', DATE '2018 11 15', 8, true, 2),
('Pikachu', DATE '2021 01 07', 15.04, false, 1),
('Devimon', DATE '2017 05 12', 11, true, 5);

/* Tuesday */
INSERT INTO animals (
    name, 
    date_of_birth, 
    weight_kg, 
    neutered,
    escape_attempts) 
VALUES 
('Charmander', DATE '2020 02 08', -11, false, 0),
('Plantmon', DATE '2021 11 15', -5.7, true, 2),
('Squirtle', DATE '1993 04 02', -12.13, false, 3),
('Angemon', DATE '2005 06 12', -45, true, 1),
('Boarmon', DATE '2005 06 07', 20.4, true, 7),
('Blossom', DATE '1998 10 13', 17, true, 3),
('Ditto', DATE '2022 05 14', 22, true, 4);

/* wednesday */
INSERT INTO owners (full_name, age)
VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species (name)
VALUES
('Pokemon'),
('Digimon');

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
('Agumon', DATE '2020-02-03', 0, 'TRUE', 10.23),
('Gabumon', DATE '2018-11-15', 2, 'TRUE', 8),
('Pikachu', DATE '2021-01-07', 1, 'FALSE', 15.04),
('Devimon', DATE '2017-05-12', 5, 'TRUE', 11),
('Charmander', DATE '2020-02-08', 0, 'FALSE', -11),
('Plantmon', DATE '2021-11-15', 2,'TRUE', -5.7),
('Squirtle', DATE '1993-04-02', 3, 'FALSE', -12.13),
('Angemon', DATE '2005-06-12', 1, 'TRUE', -45),
('Boarmon', DATE '2005-06-07', 7, 'TRUE', 20.4),
('Blossom', DATE '1998-10-13', 3, 'TRUE', 17),
('Ditto', DATE '2022-05-14', 4, 'TRUE', 22);

/*Modify your inserted animals so it includes the species_id value*/
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';

/* Modify your inserted animals to include owner information*/
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith' ) WHERE name = 'Agumon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name IN ('Angemon', 'Boarmon');