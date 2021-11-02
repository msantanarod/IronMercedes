# inner join
select * from bank.account as a
inner join bank.loan as l on 
a.account_id = l.account_id;


#left join
select * from bank.account as a
left join bank.loan as l 
on a.account_id = l.account_id;

#right join
select * from bank.account as a
right join bank.loan as l 
on a.account_id = l.account_id;
#right join en la mayoria de los casos es igual al inner join

#full join

select * from bank.account as a
left join bank.loan as l 
on a.account_id = l.account_id
