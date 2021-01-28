use sakila;

#### 1. How many copies of the film Hunchback Impossible exist in the inventory system?

SELECT 
    COUNT(*)
FROM
    sakila.inventory
GROUP BY film_id
HAVING film_id IN (SELECT 
        film_id
    FROM
        sakila.film
    WHERE
        title LIKE '%Hunchback Impossibl%');


###### 2. List all films whose length is longer than the average of all the films.

SELECT 
    film_id, title, length
FROM
    sakila.film
WHERE
    length > (SELECT 
            AVG(length) AS Avg_Length
        FROM
            film)
ORDER BY length DESC;

####  3. Use subqueries to display all actors who appear in the film Alone Trip.

SELECT 
    first_name, last_name
FROM
    sakila.actor
WHERE
    actor_id IN (SELECT 
            actor_id
        FROM
            sakila.film_actor
        WHERE
            film_id IN (SELECT 
                    film_id
                FROM
                    sakila.film
                WHERE
                    title LIKE '%Alone Trip%'));

## 4. Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.

SELECT 
    film_id, title
FROM
    sakila.film
WHERE
    film_id IN (SELECT 
            film_id
        FROM
            sakila.film_category
        WHERE
            category_id IN (SELECT 
                    category_id
                FROM
                    sakila.category
                WHERE
                    name LIKE '%family%'));

## 5. Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify the 
# correct tables with their primary keys and foreign keys, that will help you get the relevant information.

SELECT 
    CONCAT(first_name, ' ', last_name) AS 'Customer Name', email
FROM
    sakila.customer AS cust
        INNER JOIN
    sakila.address AS addr ON cust.address_id = addr.address_id
WHERE
    city_id IN (SELECT 
            city_id
        FROM
            sakila.city
        WHERE
            country_id IN (SELECT 
                    country_id
                FROM
                    sakila.country
                WHERE
                    country LIKE '%canada%'));

### 6. Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. First you will have to
#  find the most prolific actor and then use that actor_id to 
# find the different films that he/she starred.

SELECT 
    CONCAT(first_name, ' ', last_name) AS actor_name,
    film.title,
    film.release_year
FROM
    sakila.actor
        INNER JOIN
    sakila.film_actor USING (actor_id)
        INNER JOIN
    film USING (film_id)
WHERE
    actor_id = (SELECT 
            actor_id
        FROM
            film_actor
        GROUP BY actor_id
        ORDER BY COUNT(film_id) DESC
        LIMIT 1)
ORDER BY release_year DESC;

### Films rented by most profitable customer. You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments


SELECT 
    rental.customer_id,
    film.title,
    DATE_FORMAT(rental_date, '%D %M, %Y') AS 'Rental Date',
    amount
FROM
    film AS film
        INNER JOIN
    inventory USING (film_id)
        INNER JOIN
    rental USING (inventory_id)
        INNER JOIN
    payment USING (rental_id)
WHERE
    rental.customer_id = (SELECT 
            pay.customer_id
        FROM
            customer AS cust
                INNER JOIN
            payment AS pay ON cust.customer_id = pay.customer_id
        GROUP BY pay.customer_id
        ORDER BY SUM(amount) DESC
        LIMIT 1)
ORDER BY amount DESC;

## 6.  Customers who spent more than the average payments.

select * from customer;

SELECT 
    CONCAT(first_name, ' ', last_name) AS 'Customer Name'
FROM
    customer AS cust
        INNER JOIN
    payment USING (customer_id)
GROUP BY cust.customer_id
HAVING AVG(payment.amount) > (SELECT 
        AVG(amount)
    FROM
        payment);
        
        
        
select customer_id, sum(amount) as payment
from sakila.customer
inner join payment using (customer_id)
group by customer_id
having sum(amount) > (
select avg(total_payment)
from (
select customer_id, sum(amount) total_payment
from payment
group by customer_id
) t
)
order by payment desc;














    















