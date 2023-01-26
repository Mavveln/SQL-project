== Question 1==

SELECT rental_duration, COUNT(rental_duration)
FROM Film
GROUP BY rental_duration;

== Question 2==

SELECT last_name, COUNT(*) AS count
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) >3;

== Question 3==

SELECT rating, ROUND(AVG(length)) AS duration, COUNT(*) AS count, SUM(replacement_cost) AS cost
FROM film
GROUP BY rating
HAVING ROUND(AVG(length)) > 115
ORDER BY rating ASC;

== Question 4==

SELECT
CASE
	WHEN amount > 10 THEN 'Sultan'
	WHEN amount < 5 THEN 'Anak Kos'
	ELSE 'Middle Class'
END AS rental_class,
COUNT(customer_id) AS jumlah_customer
FROM payment
GROUP BY rental_class;

== Question 5==

SELECT
CASE
	WHEN date_part('day', return_date - rental_date) < 5 THEN 'Returned early'
	WHEN date_part('day', return_date - rental_date) = 5 THEN 'Returned on time'
	ELSE 'Returned late'
END AS status_return,
COUNT(*) AS total_films
FROM rental
GROUP BY status_return
ORDER BY total_films DESC;

== Question 6==

SELECT 
	CASE
	WHEN category_id = 2 THEN 'Animation'
	WHEN category_id = 11 THEN 'Horor'
	WHEN category_id = 14 THEN 'Sci-fi'
	ELSE 'Other'
END AS category,
COUNT(*) AS total_films
FROM film_category
GROUP BY category
ORDER BY category ASC;

== Question 7==

SELECT rental_rate, COUNT(*) AS count
FROM film
WHERE length > 100 AND rating IN ('PG','PG-13','NC-17')
GROUP BY rental_rate
HAVING rental_rate > 4;