USE classicmodels;

SELECT t1.orderdate, t1.orderNumber , quantityOrdered, priceeach , productname, productline, buyprice, city , country
FROM orders T1
INNER JOIN orderdetails t2
ON t1.orderNumber = t2.orderNumber
INNER JOIN products t3
ON t2.productcode = t3.productcode
INNER JOIN customers t4
ON t1.customernumber = t4.customernumber
WHERE year(orderDate) = 2004