Use classicmodels;
SELECT * 
FROM customers;

SELECT *
FROM employees;

SELECT  'customer' as type, contactFirstName as firstname,
contactLastName as lastname
from customers

union

select 'employee' as type,firstname,lastname
from employees;