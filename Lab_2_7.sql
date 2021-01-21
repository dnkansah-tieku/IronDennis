use sakila;

drop table if exists films_2020;

CREATE TABLE `films_2020` (
    `film_id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(255) NOT NULL,
    `description` TEXT,
    `release_year` YEAR(4) DEFAULT NULL,
    `language_id` TINYINT(3) UNSIGNED NOT NULL,
    `original_language_id` TINYINT(3) UNSIGNED DEFAULT NULL,
    `rental_duration` INT(6),
    `rental_rate` DECIMAL(4 , 2 ),
    `length` SMALLINT(5) UNSIGNED DEFAULT NULL,
    `replacement_cost` DECIMAL(5 , 2 ) DEFAULT NULL,
    `rating` ENUM('G', 'PG', 'PG-13', 'R', 'NC-17') DEFAULT NULL,
    PRIMARY KEY (`film_id`),
    CONSTRAINT FOREIGN KEY (`original_language_id`)
        REFERENCES `language` (`language_id`)
        ON DELETE RESTRICT ON UPDATE CASCADE
)  ENGINE=INNODB AUTO_INCREMENT=1003 DEFAULT CHARSET=UTF8;

set global local_infile = 1;


SET SQL_SAFE_UPDATES = 0;
SET FOREIGN_KEY_CHECKS=0;

load data local infile 'C:/films_2020.csv'
into table films_2020 
fields terminated by ',';

select * from films_2020;

update films_2020 set rental_duration = 3;

update films_2020 set rental_rate = 2.99;


######### part 2  #############

#1 
SELECT 
    first_name, last_name, count(*)
FROM
    sakila.actor
GROUP BY last_name
HAVING COUNT(*) < 2;

# 2
SELECT 
    last_name, count(*)
FROM
    sakila.actor
GROUP BY last_name
HAVING COUNT(*) > 1;

# 3
select * from rental;

select count(*), staff_id from sakila.rental
group by staff_id;

# 4
SELECT 
    release_year, COUNT(*) AS No_Films
FROM
    sakila.film
GROUP BY release_year
ORDER BY release_year;

#5
SELECT 
    rating, COUNT(*) AS Total_Number
FROM
    sakila.film
GROUP BY rating;
select * from film;
#6
SELECT 
    rating, ROUND(AVG(length), 2) AS 'Average Duration'
FROM
    sakila.film
GROUP BY rating;

#7
SELECT 
    rating, ROUND(AVG(length), 2) AS Average_Duration
FROM
    sakila.film
    GROUP BY rating
    having Average_Duration > 120;
    
