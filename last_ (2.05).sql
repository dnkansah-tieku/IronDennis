 ############    solution for last lab (2.05)
-- 1
SELECT 
    *
FROM
    sakila.actor
WHERE
    first_name = ‘SCARLETT’;
-- 2

SELECT 
    COUNT(*)
FROM
    sakila.rental;
-- 3
SELECT 
    *
FROM
    sakila.film;
SELECT 
    MAX(rental_duration) AS max_duration,
    MIN(rental_duration) AS min_duration
FROM
    sakila.film;
    
## 4
select floor(avg(length) / 60) as hours, round(avg(length) % 60) as minutes
from sakila.film;

## 5
SELECT 
    COUNT(DISTINCT last_name)
FROM
    actor;
    
## 6
select datediff(max(rental_date), min(rental_date)) as active_days
from rental;

## 7
SELECT 
    *,
    DATE_FORMAT(rental_date, '%M') AS Months,
    DATE_FORMAT(rental_date, '%W') AS Weekday
FROM
    sakila.rental
LIMIT 20;

## 8
SELECT 
    *,
    CASE
        WHEN DATE_FORMAT(rental_date, '%W') IN ('Saturday' , 'Sunday') THEN 'weekend'
        ELSE 'workday'
    END AS day_type
FROM
    sakila.rental;
    
select * from rental;

## 9

SELECT 
    *
FROM
    sakila.rental
ORDER BY rental_date DESC;

SELECT 
    *,
    DATE_FORMAT(rental_date, '%M') AS Month,
    DATE_FORMAT(rental_date, '%Y') AS Year
FROM
    sakila.rental
HAVING Month = 'January' AND Year = 2021;


