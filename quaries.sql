SELECT * FROM animals WHERE name ilike '%mon'
SELECT name FROM animals WHERE date_of_birth BETWEEN '01-01-2016' and '12-12-2019'
SELECT name FROM animals WHERE neutered = '1' AND escape_attempts < 3
SELECT date_of_birth FROM animals WHERE name in ('Agumon', 'Pikachu')
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5
SELECT * FROM animals WHERE neutered = '1'
SELECT * FROM animals WHERE name != 'Gabumon'
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3


/* TITLE 2 Section 1 Week 2 */

BEGIN;

ALTER TABLE animals
RENAME COLUMN species TO unspecified;
SELECT * FROM animals

ROLLBACK;

/* TITLE 2 Section 2 Week 2 */

BEGIN; 
UPDATE animals
SET species = 'digimon'
WHERE name ilike '%mon'

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL

COMMIT;

SELECT * FROM animals

/* TITLE 2 Section 3 Week 2 */

BEGIN;
DELETE FROM animals
SELECT * FROM animals
ROLLBACK;
SELECT * FROM animals;

/* TITLE 2 Section 4 Week 2 */

BEGIN;

DELETE FROM animals
WHERE date_of_birth >'1-JAN-2022'
SELECT * FROM animals

SAVEPOINT SP_1;

UPDATE animals
SET weight_kg = weight_kg * -1 

SELECT * FROM animals

ROLLBACK TO SP_1;

SELECT * FROM animals

UPDATE animals
SET weight_kg = weight_kg * -1 
WHERE weight_kg < 0

COMMIT;

SELECT * FROM animals;



/* TITLE 3  WEEK 2*/

/* 1 */

SELECT COUNT(name) FROM animals

/* 2 */

SELECT * FROM animals 
WHERE escape_attempts = 0;

/* 3 */

SELECT AVG(weight_kg) FROM animals

/* 4 */

SELECT neutered, SUM(escape_attempts) FROM animals
GROUP BY 1

/* 5 */

SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals
GROUP BY 1

/* 6 */

SELECT species, CAST(AVG(weight_kg) AS DECIMAL(10,3)) FROM animals
WHERE date_of_birth BETWEEN '01-JAN-1990' AND '31-DEC-2000'
GROUP BY 1

