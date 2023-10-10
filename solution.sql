-- Query 1
select * from bank.client
where district_id = 1
limit 5;

-- Query 2
select * from bank.client
where district_id = 72
order by client_id desc
limit 1;

-- Query 3
select amount from bank.loan
order by amount
limit 3;

-- Query 4
select distinct status from bank.loan
order by status;

-- Query 5
select *  from bank.loan
order by payments
limit 1;

-- Query 6
select account_id, amount from bank.loan
order by account_id
limit 5;

-- Query 7
select account_id from bank.loan
where duration = 60  
order by amount
limit 5;

-- Query 8
select distinct k_symbol from bank.order
order by k_symbol;

-- Query 9
select order_id from bank.order
where account_id = 34;

-- Query 10
select account_id from bank.order
where order_id between 29540 and 29560
and k_symbol = 'SIPO';

-- Query 11
select amount from bank.order
where account_to = 30067122;

-- Query 12
select trans_id, date, type, amount from bank.trans
where account_id = 793
order by date desc
limit 10;

-- Query 13

select district_id, count(*) from bank.client
where district_id < 10
Group by district_id
order by district_id;


-- Query 14
select type, count(*) from bank.card
Group by type
order by count(*) desc;

-- Query 15
select account_id, amount from bank.loan
order by amount desc
limit 10;

-- Query 16
select date, count(loan_id) from bank.loan
where date < '930907'
group by date
order by date desc;

-- Query 17
select date, duration, count(loan_id) from bank.loan
where date like '9712%'
group by date, duration
order by date;

-- Query 18
select account_id, type, sum(amount) as total_amount from bank.trans
where account_id = '396'
group by account_id, type;

-- Query 19
select account_id, FLOOR(sum(amount)) as total_amount, 
case
when type = 'PRIJEM' then 'INCOMING'
ELSE 'OUTGOING'
end as 'transaction_type'
from bank.trans
where account_id = '396'
group by transaction_type ;

-- Query 20
select account_id, 
floor(sum(case
when type = 'PRIJEM' then amount
		end)) as incomming,
		FLOOR(sum(case
			when type = 'VYDAJ' then amount
		end)) as outgoing,
		FLOOR(sum(case
			when type = 'PRIJEM' then amount
		end)) -
		FLOOR(sum(case
			when type = 'VYDAJ' then amount
		end)) as diff
	from bank.trans
where account_id = 396
group by account_id;


-- Query 21
select account_id,
		floor(sum(case
			when type = 'PRIJEM' then amount
		end)) -
		floor(sum(case
			when type = 'VYDAJ' then amount
		end)) as diff
	from bank.trans
group by account_id
order by diff desc
limit 10;
    