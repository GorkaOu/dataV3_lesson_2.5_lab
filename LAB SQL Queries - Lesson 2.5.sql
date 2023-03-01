USE sakila;
-- Select all the actors with the first name ‘Scarlett’. 
SELECT * FROM sakila.actor
WHERE first_name = "Scarlett";
-- How many films (movies) are available for rent and how many films have been rented?
SELECT * FROM sakila.rental;
-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MAX(Length) AS max_duration, MIN(Length) AS min_duration 
FROM sakila.film;
 -- What's the average movie duration expressed in format (hours, minutes)?
SELECT CONVERT(AVG(Length)*100, TIME_FORMAT = %T) 
FROM sakila.film;
 
-- How many distinct (different) actors' last names are there?
 
-- Since how many days has the company been operating (check DATEDIFF() function)?

-- Show rental info with additional columns month and weekday. Get 20 results.

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

-- Get release years.
 
-- Get all films with ARMAGEDDON in the title. 

-- Get all films which title ends with APOLLO.

-- Get 10 the longest films.

-- How many films include Behind the Scenes content?