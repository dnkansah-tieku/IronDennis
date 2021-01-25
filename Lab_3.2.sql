###  SQL Joins on multiple tables

## Write a query to display for each store its store ID, city, and country.

SELECT store_id, city, country
FROM sakila.store AS st
JOIN sakila.address AS ad
ON st.address_id = ad.address_id
JOIN sakila.city AS ci
ON ad.city_id = ci.city_id
JOIN sakila.country AS co
ON ci.country_id = co.country_id;

# 2 Write a query to display how much business, in dollars, each store brought in.

select staff.store_id, sum(amount)
from sakila.staff as staff
inner join sakila.payment as payment 
on staff.staff_id = payment.staff_id
group by staff.store_id;

# What is the average running time of films by category?

select avg(length), cate.category_id, catt.name
from sakila.film as film
inner join sakila.film_category as cate
on film.film_id = cate.film_id
#group by cate.category_id
inner join sakila.category as catt
on cate.category_id = catt.category_id
group by catt.category_id;

# Which film categories are longest?

select (avg(length)) as average_length, cate.category_id, catt.name
from sakila.film as film
inner join sakila.film_category as cate
on film.film_id = cate.film_id
inner join sakila.category as catt
on cate.category_id = catt.category_id
group by cate.category_id
order by average_length;

# Display the most frequently rented movies in descending order.
select film.title, count(rental_id)
from sakila.film as film 
inner join sakila.inventory as inven
on film.film_id = inven.film_id
inner join sakila.rental as rent
on rent.inventory_id=rent.inventory_id
group by film.film_id
order by count(rental_id); 

# List the top five genres in gross revenue in descending order.
select film.title, sum(rental_id)
from sakila.film as film 
inner join sakila.inventory as inven
on film.film_id = inven.film_id
inner join sakila.rental as rent
on rent.inventory_id=rent.inventory_id
group by film.film_id
order by count(rental_id); 


## List the top five genres in gross revenue in descending order.

select catt.category_id, catt.name, sum(amount) as 'Genre Revenue'
from sakila.payment as pay
inner join sakila.rental as rent 
on pay.rental_id = rent.rental_id
inner join sakila.inventory as invent
on rent.inventory_id = invent.inventory_id
inner join sakila.film as film
on invent.film_id = film.film_id
inner join sakila.film_category as cate
on film.film_id = cate.film_id
join sakila.category as catt 
on cate.category_id = catt.category_id
group by catt.name;

## Is "Academy Dinosaur" available for rent from Store 1?

SELECT film_id, title from sakila.film where title = 'Academy Dinosaur';

select title, store_id
from sakila.film as film 
inner join sakila.inventory as invent
on film.film_id = invent.film_id
inner join sakila.rental as rent
on rent.inventory_id = invent.inventory_id
where store_id = 1 and title = 'Academy Dinosaur';