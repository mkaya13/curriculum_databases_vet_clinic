INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Agumon', '3-FEB-2020', 0, '1', 10.23 ),
('Gabumon', '15-NOV-2018', 2, '1', 8 ),
('Pikachu', '7-JAN-2021', 1, '0',  15.04),
('Devimon', '12-MAY-2017', 5, '1', 11 );

/* DAY 2 */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Charmander', '8-FEB-2020', 0, '0', -11 ),
('Plantmon', '15-NOV-2021', 2, '1', -5.7 ),
('Squirtle', '2-APR-1993', 3, '0',  -12.13),
('Angemon', '12-JUN-2005', 1, '1', -45 ),
('Boarmon', '7-JUN-2005', 7, '1', 20.4 ),
('Blossom', '13-OCT-1998', 3, '1', 17 ),
('Ditto', '14-MAY-2022', 4, '1', 22 );

/* DAY 3 */

/* 
Insert the following data into the owners table:
Sam Smith 34 years old.
Jennifer Orwell 19 years old.
Bob 45 years old.
Melody Pond 77 years old.
Dean Winchester 14 years old.
Jodie Whittaker 38 years old. 
*/

BEGIN;

INSERT INTO owners(full_name, age)
VALUES ('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38)

select * from owners;

COMMIT;

/*
Insert the following data into the species table:
Pokemon
Digimon
*/

BEGIN;

INSERT INTO species(name)
VALUES ('Pokemon'),
('Digimon')

select * from species;

COMMIT;

/*
Modify your inserted animals so it includes the species_id value:
If the name ends in "mon" it will be Digimon
All other animals are Pokemon
*/

BEGIN;

SELECT * FROM animals;

UPDATE animals
SET species_id = CASE 
					 WHEN name ILIKE '%mon' THEN  2
					 ELSE 1
				 END

SELECT * FROM animals
ORDER BY id;

COMMIT;

/*
Modify your inserted animals to include owner information (owner_id):
Sam Smith owns Agumon.
Jennifer Orwell owns Gabumon and Pikachu.
Bob owns Devimon and Plantmon.
Melody Pond owns Charmander, Squirtle, and Blossom.
Dean Winchester owns Angemon and Boarmon.
*/

BEGIN;

UPDATE animals
SET owner_id = CASE 
					 WHEN name = 'Agumon' THEN 1
					 WHEN name in ('Gabumon','Pikachu') THEN 2
					 WHEN name in ('Devimon','Plantmon') THEN 3
					 WHEN name in ('Charmander','Squirtle','Blossom') THEN 4
					 WHEN name in ('Angemon','Boarmon') THEN 5
				 END
				 
				 
SELECT * FROM animals
ORDER BY id;

COMMIT;

/* DAY 4 */

/* UPDATE the animal_id's in animals table */

BEGIN;
UPDATE animals SET id = 1 WHERE id = 12;
UPDATE animals SET id = 2 WHERE id = 13;
UPDATE animals SET id = 3 WHERE id = 14;
UPDATE animals SET id = 4 WHERE id = 15;
UPDATE animals SET id = 5 WHERE id = 16;
UPDATE animals SET id = 6 WHERE id = 17;
UPDATE animals SET id = 7 WHERE id = 18;
UPDATE animals SET id = 8 WHERE id = 19;
UPDATE animals SET id = 9 WHERE id = 20;
UPDATE animals SET id = 10 WHERE id = 21;
COMMIT;

/* Fill the vets table */

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher', 45, '23-APR-2000'),
('Maisy Smith', 26,  '17-JAN-2019' ),
('Stephanie Mendez', 64, '4-MAY-1981'),
('Jack Harkness', 38, '8-JUN-2008');

/* Fill the specializations table according to ids of vet_id and species_id from vets and species tables */

INSERT INTO specializations (vet_id, species_id)
VALUES (1, 1),
(3, 1),
(3, 2),
(4, 2)

/* Fill the visits table */

INSERT INTO visits
VALUES 
(1, 1, '24-MAY-2020'),
(1, 3, '22-JUL-2020'),
(2, 4, '2-FEB-2021'),
(3, 2, '5-JAN-2020'),
(3, 2, '8-MAR-2020'),
(3, 2, '14-MAY-2020'),
(4, 3, '4-MAY-2021'),
(5, 4, '24-FEB-2021'),
(6, 2, '21-DEC-2019'),
(6, 1, '10-AUG-2020'),
(6, 2, '7-APR-2021'),
(7, 3, '29-SEP-2019'),
(8, 4, '3-OCT-2020'),
(8, 4, '4-NOV-2020'),
(9, 2, '24-JAN-2019'),
(9, 2, '15-MAY-2019'),
(9, 2, '27-FEB-2020'),
(9, 2, '3-AUG-2020'),
(10, 3, '24-MAY-2020'),
(10, 1, '11-JAN-2021')

