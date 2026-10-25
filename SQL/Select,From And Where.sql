SELECT *
FROM CUSTOMERS
WHERE CONTACTLASTNAME <> 'Young';

SELECT customerName,contactFirstName,contactLastName,phone,city,country
FROM Customers
WHERE COUNTRY = 'USA' AND ContactFirstName = 'Julie';

SELECT contactFirstName,contactLastName,city,country
FROM customers
WHERE country = 'Norway'
OR country = 'Sweden';

SELECT contactFirstName,contactLastName
FROM customers
WHERE contactLastName= 'Brown';

SELECT email
FROM employees
WHERE jobTitle = 'Sales Rep';