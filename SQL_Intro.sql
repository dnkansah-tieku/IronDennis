use sakila;

select * from film;
select * from actor;	# was used to select other tables  by changing with table names 

#3
#select title as Film_Title from film;

#4
select name as film_language from language;

#5
select (select count(*) from store) as No_of_stores, (select count(*) from staff) as No_of_Employees;
select first_name as first_name from staff;

# BONUS
select * from rental;
select count(distinct(rental_date)) from rental;
