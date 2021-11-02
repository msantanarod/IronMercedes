use sakila;
# 1 Which actor has appeared in the most films? We need the intersection
select first_name,last_name, count(*) from actor as a
inner join film_actor as l on 
a.actor_id = l.actor_id
group by a.actor_id
order by count(*) desc
limit 1;


#2 Most active customer (the customer that has rented the most number of films) inner join

select first_name,last_name, count(*) from customer
inner join rental on 
customer.customer_id = rental.customer_id
group by customer.customer_id
order by count(*) desc
limit 1;

#3. List number of films per category. inner join

select name, count(*) from category
inner join film_category on 
category.category_id = film_category.category_id
group by film_category.category_id
order by count(*);

#4. Display the first and last names, as well as the address, of each staff member.
select first_name,last_name,address from staff
inner join address on 
staff.address_id = address.address_id
group by address.address_id
order by address.address_id;

#5. Display the total amount rung up by each staff member in August of 2005. inner join
select first_name,last_name,sum(amount)from staff
inner join payment on 
staff.staff_id = payment.staff_id
where payment_date between 20050801 and 20050831
group by staff.staff_id
order by staff.staff_id;

#. 6 List each film and the number of actors who are listed for that film. inner join
select title, count(actor_id) from film_actor
inner join film on 
film_actor.film_id = film.film_id
group by film.film_id
order by count(actor_id) desc;

# 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
#List the customers alphabetically by last name. 


select first_name,last_name, sum(amount) from customer
inner join payment on 
customer.customer_id = payment.customer_id
group by payment.customer_id
order by last_name;

#Bonus: Which is the most rented film? 
#The answer is Bucket Brotherhood This query might require using more than one join statement. Give it a try

SELECT title , count(rental_date) FROM film 
INNER JOIN inventory on
film.film_id=inventory.film_id
INNER JOIN rental on
inventory.inventory_id=rental.inventory_id
GROUP BY title
ORDER BY count(rental_date) desc
limit 1;



