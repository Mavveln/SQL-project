-- Active: 1667270129325@@127.0.0.1@5432@postgres
SELECT LAST_NAME,
	FIRST_NAME
FROM CUSTOMER
WHERE FIRST_NAME = 'Jamie' ;


SELECT FIRST_NAME,
	ADDRESS_ID
FROM CUSTOMER
WHERE ADDRESS_ID BETWEEN 70 AND 100;

SELECT FIRST_NAME,
	LAST_NAME
FROM CUSTOMER
WHERE FIRST_NAME IN ('Ann','Anne','Annie');

SELECT FIRST_NAME,
	LAST_NAME
FROM CUSTOMER
WHERE FIRST_NAME NOT IN ('Ann','Anne','Annie');

SELECT FIRST_NAME
FROM CUSTOMER
WHERE FIRST_NAME LIKE 'A%';

SELECT FIRST_NAME
FROM CUSTOMER
WHERE FIRST_NAME IS NULL;

SELECT * FROM CUSTOMER;

SELECT DISTINCT FIRST_NAME
FROM CUSTOMER;

SELECT * FROM CUSTOMER
WHERE FIRST_NAME ='Jennifer' AND LAST_NAME ='Davis';

SELECT * FROM CUSTOMER
WHERE FIRST_NAME ='Jennifer' OR LAST_NAME ='Rose';

SELECT * FROM CUSTOMER
ORDER BY FIRST_NAME ASC;

SELECT * FROM CUSTOMER
ORDER BY FIRST_NAME DESC;

SELECT * FROM CUSTOMER
LIMIT 15;

SELECT FIRST_NAME AS NAMA
FROM CUSTOMER;

SELECT FIRST_NAME AS NAMA
FROM CUSTOMER
WHERE FIRST_NAME = 'Jared';

SELECT rental_rate, AVG(rental_rate) FROM film
GROUP BY rental_rate
ORDER BY rental_rate ASC;


SELECT film_id, title, rental_rate
FROM film
WHERE rental_rate > 2.98;

SELECT film_id, title, rental_rate
FROM film
WHERE rental_rate > (select AVG(rental_rate) FROM film);

SELECT inventory.film_id
from rental
INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
WHERE return_date BETWEEN '2005-05-27' and '2005-05-28';

SELECT film_id, title
FROM film
WHERE film_id IN (SELECT inventory.film_id
			from rental
			INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
			WHERE return_date BETWEEN '2005-05-27' and '2005-05-28'
);

-- Hands on (subqueries) --

-- Question 1

SELECT first_name, last_name, email
FROM customer
WHERE exists(SELECT customer_id
			FROM payment
			WHERE payment.customer_id = customer.customer_id);

-- Question 2
SELECT first_name, last_name, first_name || last_name as full_name
FROM customer
WHERE LENGTH(first_name || last_name) = (SELECT MAX(length(first_name || last_name))
FROM customer);

-- Question 3
SELECT first_name, last_name, first_name || last_name as full_name
FROM customer
WHERE LENGTH(first_name || last_name) = (SELECT MAX(length(first_name || last_name))
FROM customer)
UNION ALL
SELECT first_name, last_name, first_name || last_name as full_name
FROM customer
WHERE LENGTH(first_name || last_name) = (SELECT MIN(length(first_name || last_name))
FROM customer);

-- Question 4
SELECT customer_id, sum(amount) as jumlah_biaya
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
having SUM(amount)>24;

-- Question 5
SELECT film_id, title
FROM film
WHERE film_id NOT IN( SELECT film_id FROM inventory);

-- Question 6
SELECT 1 hanya_di_store, COUNT(film_id) Jumlah_film
FROM inventory
WHERE store_id = 1 AND film_id NOT IN (SELECT film_id FROM inventory WHERE store_id = 2)
UNION ALL
SELECT 2 hanya_di_store, COUNT(film_id) Jumlah_film
FROM inventory
WHERE store_id = 2 AND film_id NOT IN (SELECT film_id FROM inventory WHERE store_id =1);