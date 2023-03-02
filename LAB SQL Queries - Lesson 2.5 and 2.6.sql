USE sakila;
-- Lab | SQL Queries - Lesson 2.5 

-- 1. Select all the actors with the first name ‘Scarlett’. 
SELECT * FROM sakila.actor
WHERE first_name = "Scarlett";

-- 2. How many films (movies) are available for rent and how many films have been rented?
SELECT COUNT(DISTINCT film_id)
FROM sakila.inventory; -- 958 films on the inventory 

SELECT COUNT(DISTINCT title)
FROM sakila.film; --  1000 films titles

-- So we have 42 rented films and 958 are available

-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MAX(Length) AS max_duration, MIN(Length) AS min_duration 
FROM sakila.film;

 -- 4. What's the average movie duration expressed in format (hours, minutes)?
SELECT SEC_TO_TIME(round(AVG (length*60),0)) AS avg_film_time
FROM film;
 
-- 5. How many distinct (different) actors' last names are there?
 SELECT COUNT(DISTINCT last_name) FROM sakila.actor;
 
-- 6. Since how many days has the company been operating (check DATEDIFF() function)?
SELECT DATEDIFF(max(payment_date),min(payment_date)) AS "days operating"
FROM sakila.payment;

-- 7. Show rental info with additional columns month and weekday. Get 20 results.
SELECT *, DATE_FORMAT(rental_date, "%M") AS "month", DATE_FORMAT(rental_date, "%W") AS "weekday"
FROM SAKILA.RENTAL
LIMIT 20;

-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *, DATE_FORMAT(rental_date, "%M") AS "month", DATE_FORMAT(rental_date, "%W") AS "weekday", 
CASE
WHEN (DATE_FORMAT(rental_date, "%W") = "Saturday") OR (DATE_FORMAT(rental_date, "%W") = "Sunday") THEN "Weekend"
ELSE "Workday"
END AS   "day type" 
FROM SAKILA.RENTAL
LIMIT 20;

-- 9. Get release years.
SELECT DISTINCT(release_year)
FROM film;

-- 10. Get all films with ARMAGEDDON in the title. 
SELECT title
FROM sakila.film
WHERE title LIKE '%ARMAGEDDON%';

-- 11. Get all films which title ends with APOLLO.
SELECT title
FROM sakila.film
WHERE title LIKE '%APOLLO';

-- 12. Get 10 the longest films. 
-- I interpretated like they want the longest films name
SELECT title
FROM sakila.film
ORDER BY LENGTH(title) DESC
LIMIT 10;

-- 13. How many films include Behind the Scenes content?
SELECT COUNT(SPECIAL_FEATURES)
FROM sakila.film
WHERE special_features LIKE "%Behind the scene%";


-- Lab | SQL Queries - Lesson 2.6

-- 1. In the table actor, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
SELECT DISTINCT last_name, first_name
FROM sakila.actor
GROUP BY last_name, first_name
HAVING COUNT(*) = 1;

-- 2. Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once
SELECT DISTINCT last_name, first_name
FROM sakila.actor
GROUP BY last_name, first_name
HAVING COUNT(*) > 1;

-- 3. Using the rental table, find out how many rentals were processed by each employee.
SELECT staff_id, COUNT(rental_id) AS total_rentals
FROM sakila.rental
GROUP BY staff_id;

-- 4. Using the film table, find out how many films were released each year.
SELECT release_year, COUNT(release_year) AS total_films
FROM sakila.film
GROUP BY release_year;

-- 5. Using the film table, find out for each rating how many films were there.
SELECT rating, COUNT(rating) AS total_films
FROM sakila.film
GROUP BY rating;

-- 6. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT rating, ROUND(AVG(length),2) AS mean_length
FROM sakila.film
GROUP BY rating;

-- 7. Which kind of movies (rating) have a mean duration of more than two hours?
SELECT rating, ROUND(AVG(length),2) AS mean_length
FROM sakila.film
GROUP BY rating
HAVING ROUND(AVG(length),2) > 120;

-- 8. Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
SELECT title, length, RANK() OVER(ORDER BY length DESC)
FROM sakila.film;