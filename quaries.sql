SELECT * FROM animals WHERE name ilike '%mon'
SELECT name FROM animals WHERE date_of_birth BETWEEN '01-01-2016' and '12-12-2019'
SELECT name FROM animals WHERE neutered = '1' AND escape_attempts < 3
SELECT date_of_birth FROM animals WHERE name in ('Agumon', 'Pikachu')
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5
SELECT * FROM animals WHERE neutered = '1'
SELECT * FROM animals WHERE name != 'Gabumon'
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3