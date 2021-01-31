select * from sakila.rental;

###
drop table if exists rentals_may;

CREATE TABLE sakila.rentals_may AS
    SELECT *
    FROM sakila.rental
    WHERE MONTH(rental_date) = 5;
    
select * from rentals_may;

###
drop table if exists rentals_june;
###
CREATE TABLE sakila.rentals_june AS
    SELECT *
    FROM sakila.rental
    WHERE MONTH(rental_date) = 6;

###
select count(*) from sakila.rentals_june;
###
select count(*) from sakila.rentals_may;
select * from rentals_may;

select customer_id, count(*) from sakila.rentals_may
group by customer_id;

select * 
from rentals_may as may
inner join rentals_june as june
on may.customer_id = june.customer_id;




