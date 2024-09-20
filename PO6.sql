alter table Customers add column random_value Decimal(10, 2);

SELECT * FROM Customers c 

update Customers 
set random_value = rand() * 100

alter table Customers add column second_random_value DECIMAL(10, 2);

update Customers 
set second_random_value = random_value * 2;

alter table Customers 
drop column random_value;

select 
customer_id, 
loan_type, 
	avg(loan_amount) AS avg_payment
FROM Loans l 
group by 1,2;


WITH avg_payments AS (
select AVG(loan_amount) AS overall_avg
from loans
),
customer_avg AS (
select customer_id, loan_type, AVG(loan_amount) AS avg_payment
from loans 
group by customer_id, loan_type
)
SELECT customer_id, loan_type
FROM customer_avg
WHERE avg_payment < (SELECT overall_avg FROM avg_payments);


