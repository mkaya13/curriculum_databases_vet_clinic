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

/* TASK 1 */

BEGIN;

ALTER TABLE animals
DROP COLUMN species;

SELECT * FROM animals
order by id;

COMMIT;

/* TASK 2 */

BEGIN;

ALTER TABLE animals
ADD (species_id) INT REFERENCES species(id);

SELECT * FROM animals
ORDER BY id;

COMMIT;

/* TASK 3 */

BEGIN;

ALTER TABLE animals
ADD owner_id INT references owners(id)

SELECT * FROM animals
ORDER BY id;

COMMIT;
