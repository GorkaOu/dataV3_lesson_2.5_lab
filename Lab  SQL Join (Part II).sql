USE sakila;

-- 1. Write a query to display for each store its store ID, city, and country.
SELECT s.store_id, c.city, k.country
FROM sakila.store s
JOIN sakila.address a ON s.address_id = a.address_id
JOIN bank.city c ON a.city_id = c.city_id
JOIN bank.country k ON c.country_id = k.country_id;

-- 2. Write a query to display how much business, in dollars, each store brought in.

SELECT st.store_id, CONCAT('$', FORMAT(sum(p.amount),2)) AS total_amount
FROM sakila.store st
JOIN sakila.staff s USING (store_id)
JOIN sakila.payment p USING (staff_id)
GROUP BY st.store_id;

-- 3. Which film categories are longest?

SELECT c.name, SEC_TO_TIME(AVG(length*60)) AS avg_length
FROM sakila.category c
JOIN sakila.film_category fc USING (category_id)
JOIN sakila.film f USING (film_id)
GROUP BY c.name
ORDER BY avg_length DESC;

-- 4. Display the most frequently rented movies in descending order.
SELECT f.title, count(r.rental_date) AS time_rented
FROM film f
JOIN inventory i USING (film_id)
JOIN rental r USING (inventory_id)
GROUP BY f.title
ORDER BY time_rented DESC;

-- 5. List the top five genres in gross revenue in descending order.
SELECT c.name, SUM(p.amount) as gross_rev
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN inventory i ON fc.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY c.name
ORDER BY gross_rev
LIMIT 5;

-- 6. Is "Academy Dinosaur" available for rent from Store 1?
SELECT DISTINCT f.title, i.store_id
FROM film f
JOIN inventory i ON f.film_id = i.film_id
WHERE f.title ="ACADEMY DINOSAUR" AND i.store_id= "1";

-- The answer is yes.

-- 7. Get all pairs of actors that worked together. SELF JOIN
SELECT a1.actor_id AS actor_1, a2.actor_id AS actor_2, a1.film_id
FROM sakila.film_actor a1
JOIN sakila.film_actor a2
ON (a1.actor_id != a2.actor_id) AND (a1.film_id = a2.film_id)
ORDER BY a1.film_id;

-- 8. Get all pairs of customers that have rented the same film more than 3 times. EXTREMELY HARD


-- 9. For each film, list actor that has acted in more films.