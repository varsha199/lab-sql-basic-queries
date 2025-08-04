USE sakila;
-- Display all available tables in the Sakila database.
SHOW tables;

-- Retrieve all the data from the tables actor, film and customer.
SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM customer;

-- Retrieve the following columns from their respective tables:
-- Titles of all films from the film table
SELECT title FROM film;

-- List of languages used in films, with the column aliased as language from the language table
SELECT name FROM language;

-- List of first names of all employees from the staff table
SELECT first_name FROM staff;

-- Retrieve unique release years.
SELECT DISTINCT release_year FROM film;

-- Counting records for database insights:
-- Determine the number of stores that the company has.
SELECT COUNT(*) AS store_count FROM store;

-- Determine the number of employees that the company has.
SELECT COUNT(*) AS employees_count FROM staff;

-- Determine how many films are available for rent and how many have been rented.

SELECT COUNT(DISTINCT inventory.film_id) AS fils_available FROM inventory;
-- how many have been rented.
SELECT COUNT(DISTINCT inventory.film_id) AS films_rented 
FROM rental
JOIN inventory on rental.inventory_id = inventory.inventory_id;

--  Determine the number of distinct last names of the actors in the database.
SELECT COUNT(DISTINCT last_name) AS unique_lastname FROM actor;

-- Retrieve the 10 longest films.
SELECT * FROM film
ORDER BY length DESC LIMIT 10;

-- Use filtering techniques in order to:
-- Retrieve all actors with the first name "SCARLETT".
SELECT * FROM actor
WHERE first_name = 'SCARLETT';

-- BONUS: Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.
-- Hint: use LIKE operator. More information here.
SELECT * FROM  film 
WHERE film.title LIKE '%ARMAGEDDON%' AND length > 100;

-- Determine the number of films that include Behind the Scenes content
SELECT Count(*) FROM film
WHERE film.special_features LIKE '%Behind the scenes%';

SELECT Count(*) FROM film
WHERE FIND_IN_SET('Behind the scenes', special_features)>0;