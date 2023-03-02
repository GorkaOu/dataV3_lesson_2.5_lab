USE sakila;
-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT  c.name, COUNT(f.film_id) AS Total_films
FROM sakila.category c
INNER JOIN sakila.film_category f
USING (category_id)
GROUP BY c.name
ORDER BY Total_films DESC; 

-- 2. Display the total amount rung up sold by each staff member in August of 2005.
SELECT  s.username, SUM(P.amount) AS Total_amount  
FROM sakila.payment p
INNER JOIN sakila.staff s
USING (staff_id)
WHERE payment_date between "2005-08-01%" AND "2008-08-30%"
GROUP BY s.username
ORDER BY Total_amount DESC;


-- 3. Which actor has appeared in the most films?
SELECT  a.first_name, a.last_name, COUNT(f.actor_id) AS total_film  
FROM sakila.actor a
INNER JOIN sakila.film_actor f
USING (actor_id)
GROUP BY a.first_name, a.last_name
ORDER BY total_film DESC;


-- 4. Most active customer (the customer that has rented the most number of films)
SELECT  c.first_name, c.last_name, COUNT(r.rental_id) AS total_rentals  
FROM sakila.customer c
INNER JOIN sakila.rental r
USING (customer_id)
GROUP BY c.first_name, c.last_name
ORDER BY total_rentals DESC;	


-- 5. Display the first and last names, as well as the address, of each staff member.
SELECT  s.first_name, s.last_name, address
FROM sakila.staff s
INNER JOIN sakila.address a
USING (address_id);

-- 6. List each film and the number of actors who are listed for that film.
SELECT f.title, COUNT(a.actor_id) AS num_actors
FROM sakila.film f
INNER JOIN sakila.film_actor a
USING (film_id)
GROUP BY f.title
ORDER BY num_actors DESC;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT c.last_name, SUM(p.amount) AS Total_paid
FROM sakila.customer c
INNER JOIN sakila.payment p
USING (customer_id)
GROUP BY c.last_name
ORDER BY c.last_name ASC;

-- 8. List number of films per category.
 
SELECT f.title, c.name AS cat_name
FROM film f
JOIN film_category m 
ON f.film_id = m.film_id
JOIN category c 
ON m.category_id = c.category_id
ORDER BY cat_name;
 
