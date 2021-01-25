## 1 List number of films per category.
## Lab | SQL Join

# 1 List number of films per category.
select * from sakila.film;
select * from sakila.film_category;
select * from sakila.category;

select film.film_id, title as Film_Title, cate.category_id, category.name as Catergory_name
from sakila.film as film 
inner join sakila.film_category as cate
on film.film_id = cate.film_id
inner join sakila.category as category
on cate.category_id=category.category_id
group by category_id;

## 2 Display the first and last names, as well as the address, of each staff member.
select * from sakila.staff;
select * from sakila.address;

select staff.first_name, staff.last_name, addre.address 
from sakila.staff as staff
inner join sakila.address as addre
on staff.address_id = addre.address_id;

## 3. Display the total amount rung up by each staff member in August of 2005.

select sum(amount), staff.first_name, staff.last_name, date_format(payment_date, '%Y-%M') as Payment_date
from sakila.staff as staff
inner join sakila.payment as pay 
on staff.staff_id=pay.staff_id
where date_format(payment_date, '%Y%m') = 200508
group by staff.staff_id;

## 4. List each film and the number of actors who are listed for that film.

select * from sakila.film;

select actor.actor_id, count(*) as 'No of Actors', film.title
from sakila.film as film
inner join sakila.film_actor as actor
on film.film_id=actor.film_id
group by actor.actor_id;

## 5. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

select pay.customer_id, cust.last_name, cust.first_name, sum(amount)
from sakila.payment as pay
inner join sakila.customer as cust
on pay.customer_id = cust.customer_id
group by pay.customer_id;






















SELECT * FROM sakila.store AS st
JOIN sakila.address AS ad
ON st.address_id = ad.address_id
JOIN sakila.city AS ci
ON ad.city_id = ci.city_id
JOIN sakila.country AS co
ON ci.country_id = co.country_id;












