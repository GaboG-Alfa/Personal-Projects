USE classicmodels;

SELECT *
FROM
(SELECT orderDate,count(orderNumber) orders
FROM orders
GROUP BY orderDate) t1
WHERE orderDate > '2005-05-01';