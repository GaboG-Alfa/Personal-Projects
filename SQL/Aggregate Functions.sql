USE classicmodels;

SELECT customerName, count(orderNumber) as orders
FROM orders t1
INNER JOIN customers t2 
ON t1.customerNumber = t2.customerNumber 
GROUP BY customerName
ORDER BY orders DESC
LIMIT 1;

SELECT customerName, min(orderDate) as first_orderDate, max(orderDate) as latest_orderDate
FROM orders t1
INNER JOIN customers t2 
ON t1.customerNumber = t2.customerNumber
GROUP BY customerName; 