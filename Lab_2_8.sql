## 1.  Rank films by length (filter out the rows that have nulls or 0s in length column). 
##     In your output, only select the columns title, length, and the rank.

use sakila;
select * from film;
 #1
select title, length, rank() over(order by length) as Ranking
from sakila.film
where length is not null and length > 0;

## 2. Rank films by length within the rating category (filter out the rows that have nulls or 0s in length column). 
##    In your output, only select the columns title, length, rating and the rank.

select title, length, rating, rank() over(partition by rating order by length) as ORDER_well
from sakila.film
where length <> 0 and length <> ' '
order by rating, length desc;


## 3. How many films are there for each of the categories in the category table. Use appropriate join to write this query

select count(*) as film_count, cate.category_id, catt.name
from sakila.film as film
inner join sakila.film_category as cate
on film.film_id = cate.film_id
inner join sakila.category as catt using (category_id)
group by category_id;

## 4.  Which actor has appeared in the most films?

select count(*) as 'No of films per actor', actor_id 
from sakila.film as film 
inner join sakila.film_actor using (film_id)
group by actor_id;

## 5. Most active customer (the customer that has rented the most number of films)


select cust.customer_id, concat(first_name, ' ', last_name ) as Name, count(*) as 'No. of rentals'
from rental 
inner join customer cust using (customer_id)
group by cust.customer_id
order by 'No. of rentals' desc;










