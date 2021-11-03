use sakila;
# 1. How many copies of the film Hunchback Impossible exist in the inventory system?

select title, (
  select count(*) from inventory
 where film.film_id=inventory.film_id
)  as "number of copies"
from film
where title="Hunchback Impossible";

# without the subquery

select title, count(*)  from film
inner join inventory on
film.film_id=inventory.film_id
where title="Hunchback Impossible"
group by title
order by inventory.film_id;


#2. List all films whose length is longer than the average of all the films.


select title, length from film
where length > (select avg(length) from film)
order by length;

# 3. Use subqueries to display all actors who appear in the film Alone Trip.

select first_name,last_name
from actor
where actor_id in
(select actor_id
from film_actor
where film_id in
(select film_id
from film
where title="Alone Trip"
))
order by first_name;

#another way to do it

select first_name, last_name from actor
inner join film_actor on
actor.actor_id=film_actor.actor_id
inner join film on
film.film_id=film_actor.film_id
where title = 'Alone Trip'
group by first_name, last_name
order by first_name;


# 4. Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.

select  title
from film
where film_id in

(select film_id
from film_category
where category_id in

(select category_id
from category
where name="Family"
))
order by title;


select title, name from film
inner join film_category on
film.film_id=film_category.film_id
inner join category on 
film_category.category_id=category.category_id
where name = 'family'
group by title, name
order by title;

# 5. Get name and email from customers from Canada using subqueries. Do the same with joins. 
#Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.

select first_name, last_name, email
from customer
where address_id in

(select address_id
from address
where city_id in

(select city_id
from city
where country_id in

(select country_id
from country
where country= "Canada"
)))
order by last_name;


# with Joins

select first_name, last_name, email from customer
inner join address on
customer.address_id=address.address_id
inner join city on 
address.city_id=city.city_id
inner join country on 
city.country_id=country.country_id
where country="Canada"
group by first_name,last_name, email
order by last_name;



# 6. Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. 
#First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.
select *from actor_info
where actor_id=107;

# getting actor id

select actor_id, first_name,last_name from actor
inner join film_actor using (actor_id)
inner join film using (film_id)
group by actor_id
order by count(film_id)
desc
limit 1;

# guetting names of films

SELECT concat(first_name, " ", last_name) as actor_name,
    title
FROM
    actor
        INNER JOIN
    film_actor USING (actor_id)
        INNER JOIN
    film USING (film_id)
WHERE
    actor_id = (SELECT
            actor_id
        FROM
            actor
                INNER JOIN
            film_actor USING (actor_id)
                INNER JOIN
            film USING (film_id)
        GROUP BY actor_id
        ORDER BY COUNT(film_id) DESC
        LIMIT 1);
        



# 7. Films rented by most profitable customer. You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments

#getting the name of the most profitable customer
select
first_name,
last_name,
sum(payment.amount)
from payment
join customer
on payment.customer_id=customer.customer_id
group by customer.first_name,
customer.last_name
order by sum(payment.amount) desc
limit 1;

select customer_id from customer
where first_name=("Karl") and last_name=("Seal");

# customer_id id 526

#
SELECT concat(first_name, " ", last_name) as customer_name,
    title
FROM
    customer
        INNER JOIN
    payment USING (customer_id)
        INNER JOIN
    rental USING (rental_id)
		INNER JOIN
        inventory using (inventory_id)
        INNER JOIN
        film using (film_id)
WHERE
    customer.customer_id = 526
    order by title;

# 8. Customers who spent more than the average payments.

#get the average
select avg(amount) from payment;

# code

select distinct first_name, last_name as customer_name, amount
from customer
inner join
payment using(customer_id)
where amount > (select avg(amount) from payment)
order by amount;

