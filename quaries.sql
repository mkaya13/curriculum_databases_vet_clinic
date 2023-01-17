/* DAY 1 */

SELECT * FROM animals WHERE name ilike '%mon'
SELECT name FROM animals WHERE date_of_birth BETWEEN '01-01-2016' and '12-12-2019'
SELECT name FROM animals WHERE neutered = '1' AND escape_attempts < 3
SELECT date_of_birth FROM animals WHERE name in ('Agumon', 'Pikachu')
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5
SELECT * FROM animals WHERE neutered = '1'
SELECT * FROM animals WHERE name != 'Gabumon'
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3


/* DAY 2 */

/* TITLE 2 Section 1 */

BEGIN;

ALTER TABLE animals
RENAME COLUMN species TO unspecified;
SELECT * FROM animals

ROLLBACK;

/* TITLE 2 Section 2 */

BEGIN; 
UPDATE animals
SET species = 'digimon'
WHERE name ilike '%mon'

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL

COMMIT;

SELECT * FROM animals

/* TITLE 2 Section 3 */

BEGIN;
DELETE FROM animals
SELECT * FROM animals
ROLLBACK;
SELECT * FROM animals;

/* TITLE 2 Section 4 */

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

/* DAY 2 TITLE 3 */

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

/* DAY 3 */

/* 1
What animals belong to Melody Pond?
*/

SELECT an.id,an.name,an.owner_id,ow.full_name FROM animals an
LEFT JOIN owners ow
ON an.owner_id = ow.id
WHERE ow.full_name = 'Melody Pond'
ORDER BY an.id

/* 2
List of all animals that are pokemon (their type is Pokemon).
*/

SELECT an.id,an.name,an.species_id,sp.name FROM animals an
LEFT JOIN species sp
ON an.species_id = sp.id
WHERE sp.name='Pokemon'
ORDER BY an.id

/* 3
List all owners and their animals, remember to include those that don't own any animal.
*/

SELECT ow.full_name, an.name  FROM owners ow
LEFT JOIN animals an
ON ow.id = an.owner_id
ORDER BY full_name;

/* 4
How many animals are there per species?
*/

SELECT sp.name as species_name, COUNT(an.id) FROM animals an
LEFT JOIN species sp
ON an.species_id = sp.id
GROUP BY sp.name;

/*
List all Digimon owned by Jennifer Orwell.
*/

SELECT ow.full_name, an.name, sp.name  FROM owners ow
LEFT JOIN animals an
ON ow.id = an.owner_id 
LEFT JOIN species sp
ON an.species_id = sp.id
WHERE ow.full_name = 'Jennifer Orwell'
AND sp.name = 'Digimon'
ORDER BY full_name;

/*
List all animals owned by Dean Winchester that haven't tried to escape.
*/

SELECT ow.full_name, an.name, an.escape_attempts  FROM animals an
LEFT JOIN owners ow
ON ow.id = an.owner_id
WHERE ow.full_name = 'Dean Winchester'
AND an.escape_attempts = 0

/*
Who owns the most animals?
*/

SELECT full_name, animal_owned_count FROM (
SELECT ow.full_name, COUNT(an.id) as animal_owned_count FROM animals as an
LEFT JOIN owners ow
ON ow.id = an.owner_id
GROUP BY 1
HAVING COUNT(ow.id) = (SELECT MAX(animal_owned_count) FROM (
SELECT ow.full_name, COUNT(an.id) as animal_owned_count FROM animals as an
LEFT JOIN owners ow
ON ow.id = an.owner_id
GROUP BY 1
) as foo)
) as doo




