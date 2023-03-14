--How many actors are there with the last name ‘Wahlberg’?
SELECT *
FROM actor
WHERE last_name = 'Wahlberg';
--Ans: 2

--2. How many payments were made between $3.99 and $5.99?
SELECT Count(amount)
FROM payment
WHERE amount BETWEEN 3.99 and 5.99;
--Ans: 5607

--3. What films have exactly 7 copies? (search in inventory)
--SELECT Count(copies)
SELECT film_id, count(film_id)
FROM inventory
GROUP BY film_id 
HAVING count(film_id) = 7;
--Ans several films(see list)

--4. How many customers have the first name ‘Willie’?

SELECT first_name, last_name
FROM customer
WHERE first_name = 'Willie';
--Ans: 2

--5. What store employee (get the id) sold the most rentals (use the rental table)?
SELECT staff_id, Count(staff_id)
FROM rental
GROUP BY staff_id;
--Ans staff_id 1


--6. How many unique district names are there?
SELECT count(DISTINCT district) AS "Number of Districts"
FROM address;
--Ans 378


--7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT count(actor_id), film_id
FROM film_actor
GROUP BY film_id
ORDER by "count" DESC;
--Ans - 508


--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT first_name, last_name
FROM customer
WHERE store_id = 1 and last_name LIKE '%es';
--Ans - 13


--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)
SELECT amount, count(DISTINCT amount)
FROM payment
WHERE customer_id BETWEEN 380 and 430
GROUP BY amount  
HAVING count(amount) > 250;
--Ans 3 (0.99), (2.99), (4.99)


--10. Within the film table, how many rating categories are there? And what rating has the most
--movies total?
SELECT count(rating), rating
FROM film
Group by rating
order by count(rating) DESC;
--Ans 5 types with PG-13 having the most and for whatever reason NC-17 is in second

