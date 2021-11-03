use bank;

# Example 1 from presentation
# give the customer who has borrowed amount higher than the average amount by cst


select * from loan where amount> (select avg(amount) from loan);
#other way to do it. It is not correct. I have to find another way to do it wihout the subquesries
select account_id from loan
where amount>avg(amount)
group by account_id
having avg(amount)
order by account_id;

#example 2
# get for each account the total amount transferred
# child query

select account_id, bank_to, account_to, round(sum(amount),2) as Total from bank.order
group by account_id,bank_to, account_to;

#parent query:

select * from (
  select account_id, bank_to, account_to, round(sum(amount),2) as Total
  from bank.order
  group by account_id, bank_to, account_to
)  as sub1
where Total > 10000;

# can we do it without the subquery?: YES with HAVING. 
select account_id, bank_to, account_to, round(sum(amount),2) as Total
from bank.order
group by account_id, bank_to, account_to
having Total>1000;

#Select the banks from the list of banks which have average transaction amounts higher than 5.5K and are not ‘ST’



# create temporary table:

create temporary table bank.loan_and_account
select l.loan_id, l.account_id, a.district_id, l.amount, l.payments, a.frequency
from bank.loan l
join bank.account a
on l.account_id = a.account_id;

select * from bank.loan_and_account

#another example. create the temporary table with the subquery of example 3

select * from (
  select account_id, bank_to, account_to, round(sum(amount),2) as Total
  from bank.order
  group by account_id, bank_to, account_to
)  as sub1
where Total > 10000;

create temporary table bank.amounts_transfered_per_account_destination_bank
select account_id, bank_to, account_to, round(sum(amount),2) as Total
  from bank.order
  group by account_id, bank_to, account_to;
  
  select * from amounts_transfered_per_account_destination_bank
  where Total>1000;
  
  
  
  ### views
  
create view view_amounts_transfered_per_account_destination_bank as
select account_id, bank_to, account_to, round(sum(amount),2) as Total
from bank.order
group by account_id, bank_to, account_to;

select * from view_amounts_transfered_per_account_destination_bank
  where Total>1000;
  
  




