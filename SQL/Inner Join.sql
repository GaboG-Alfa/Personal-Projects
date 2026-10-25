SELECT * 
FROM orders T1
INNER JOIN customers T2
ON T1.customerNumber = T2.customerNumber
WHERE T1.customerNumber = 363;

SELECT * 
FROM orders
WHERE ordernumber = 10100;

SELECT *
FROM customers
WHERE