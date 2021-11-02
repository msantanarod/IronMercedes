use sakila;
# query number 2:
SELECT * FROM actor, address, category, city, country, customer, film,film_actor,film_category,film_text,inventory,language,payment,rental,staff,store;
#query number 3:
select title from film;
#query number 4:
select *,name AS language from language;
#query number 5.1:
select count(*) from store;
#query number 5.2
select count(*) from staff;
#query number 5.3
select first_name from staff;







