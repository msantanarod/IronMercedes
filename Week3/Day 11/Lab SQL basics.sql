use bank;
#query number 1:
select client_id from client where district_id=1 limit 5;
# query number 2:
select client_id from client where district_id=72 order by client_id desc limit 1;
# query number 3:
select amount from loan order by amount limit 3;
#query number 4:
select distinct(status) from loan order by status;
# query number 5:
select loan_id from loan order by payments desc limit 1;
#query number 6:
select account_id,amount from loan order by account_id limit 5;
# query number 7:
select account_id from loan where duration=60 order by amount limit 5;
# query number 8:
select distinct(k_symbol) from `order`limit 5;
# query number 9:
select order_id from `order` where account_id=34;
# query number 10:
select distinct(account_id) from `order` where order_id between 29540 and 29560;
#query number 11:
select amount from `order` where account_to= 30067122;
#query number 12:
select trans_id,date,type,amount from trans where account_id=793 order by date desc limit 10;
# query number 13:
select district_id,count(*) from client where district_id<10 group by district_id order by district_id ;
#query number 14:
select type,count(*) from card group by type;
#query number 15:
select account_id,sum(amount) from loan group by account_id having sum(amount) order by sum(amount) desc limit 10 ;
#  query number 16:
select date,count(*) from loan where date<930907 group by date having count(*) order by date desc;
#query number 17:
select date,duration,count(*) from loan where date between 971201 and 971231 group by date,duration having count(*) order by date;
#query number 18:
select account_id, sum(amount), type as total_amount from trans where account_id=396 group by type having sum(amount) order by type;
# query number 19:
select account_id, IF(type = 'PRIJEM', 'INCOMING', 'OUTGOING') AS transaction_type, floor(sum(amount)) as total_amount from trans where account_id=396 group by type having sum(amount) order by type;


