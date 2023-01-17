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

