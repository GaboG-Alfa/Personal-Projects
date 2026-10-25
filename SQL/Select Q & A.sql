SELECT * 
FROM customers
WHERE (country = 'USA'
OR country = 'UK')
AND contactLastName = 'Brown';

SELECT * 
FROM employees
WHERE jobTitle = 'Sales Rep';