#1
use sakila;

SELECT DISTINCT
    (release_year)
FROM
    sakila.film;

select release_year, count(*) from sakila.film
group by release_year;

#2
SELECT 
    *
FROM
    sakila.film
WHERE
    title LIKE '%ARMAGEDDON%';

#3
SELECT 
    *
FROM
    sakila.film
WHERE
    title LIKE '%_APOLLO%';

select * from sakila.film_text;

#4
SELECT 
    title
FROM
    sakila.film
ORDER BY length
LIMIT 10;

#5
SELECT 
    COUNT(*)
FROM
    sakila.film
WHERE
    special_features LIKE '%Behind the Scenes%';

#6
alter table sakila.staff drop column picture;

#7
SELECT 
    *
FROM
    sakila.customer
WHERE
    first_name = 'Tammy'
        AND last_name = 'Sanders';   ####  using the customer table information to update the staff records

insert into sakila.staff (first_name, last_name, email, address_id, store_id, active, username) values ('TAMMY', 'SANDERS','TAMMY.SANDERS@sakilacustomer.org', 79, 2, 1,'tammy');
   
# 8
SELECT 
    *
FROM
    sakila.customer
WHERE
    first_name = 'charlotte'
        AND last_name = 'Hunter';

insert into sakila.rental (rental_date, inventory_id, customer_id, staff_id) values (curdate(), 1, 130, 1);

SELECT 
    *
FROM
    sakila.rental
ORDER BY rental_date DESC;

create table deleted_users (
customer_id int unique not null,
email varchar(255) unique not null,
delete_date date
);

select * from deleted_users;

insert into deleted_users
select customer_id, email, curdate()
from sakila.customer 
where active =0;

select * from deleted_users;

delete from sakila.customer where active=0;

select * from sakila.customer where active=0;