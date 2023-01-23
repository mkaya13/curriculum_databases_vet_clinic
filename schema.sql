CREATE TABLE animals(
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  date_of_birth DATE NOT NULL,
  escape_attempts INTEGER NOT NULL,
  neutered BIT NOT NULL,
  weight_kg DECIMAL NOT NULL
);

/* DAY 2 */

ALTER TABLE animals
ADD species VARCHAR;

/* DAY 3 */

/*
Create a table named owners with the following columns:
id: integer (set it as autoincremented PRIMARY KEY)
full_name: string
age: integer
*/

CREATE TABLE owners(
  id SERIAL PRIMARY KEY,
  full_name VARCHAR NOT NULL,
  age INTEGER NOT NULL
)

/* 
Create a table named species with the following columns:
id: integer (set it as autoincremented PRIMARY KEY)
name: string 
*/

CREATE TABLE species(
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL
)

/* Modify animals table: */

/* TASK 1  --> In animals table, id is already set to autoincremented PRIMARY KEY */


/* TASK 2 */

BEGIN;

ALTER TABLE animals
DROP COLUMN species;

SELECT * FROM animals
order by id;

COMMIT;

/* TASK 3 */

BEGIN;

ALTER TABLE animals
ADD (species_id) INT REFERENCES species(id);

SELECT * FROM animals
ORDER BY id;

COMMIT;

/* TASK 4 */

BEGIN;

ALTER TABLE animals
ADD owner_id INT references owners(id)

SELECT * FROM animals
ORDER BY id;

COMMIT;

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

UPDATE animals
SET species_id = CASE 
					WHEN name ILIKE '%mon' THEN  2
					ELSE 1
				 END

SELECT * FROM animals
ORDER BY id;

COMMIT;

/* DAY 4 */

/* Create the vets table */

CREATE TABLE vets (
 id SERIAL PRIMARY KEY,
 name VARCHAR,
 age INTEGER,
 date_of_graduation DATE
)

/* Create the specializations table */

CREATE TABLE specializations (
 vet_id INTEGER, 
 species_id INTEGER
)

/* Create the visits table */

CREATE TABLE visits (
 animal_id INTEGER, 
 vet_id INTEGER,
 visit_date DATE
)

/* WEEK 2 DAY 1 */

BEGIN;

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

COMMIT;

/* Performance Checks to query Tables */

/* visits table performance improvements */

-- Before adding the indexing
BEGIN;

/* Test 1 */
EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animals_id = 4;
SELECT COUNT(*) FROM visits where animals_id = 4;

/* Test 2 */
EXPLAIN ANALYZE SELECT * FROM visits where vet_id = 2;

/* Add indexing to table */
CREATE INDEX visits_animal_id_index ON visits(animal_id);

-- After adding the indexing
EXPLAIN ANALYZE SELECT COUNT(*) FROM visits WHERE animals_id = 4;
EXPLAIN ANALYZE SELECT * FROM visits where vet_id = 2;

COMMIT;

/* owners table performance improvements */

/* Test 1 */
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';

/* After adding filtering to query, since we know the approximate location, significant performance improvement */
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com'
AND id between 15000 AND 35000
