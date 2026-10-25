USE classicmodels;
SELECT productcode,count(ordernumber) as orders
FROM orderDetails
GROUP BY productcode;

SELECT productcode,avg(ordernumber) as average
FROM orderDetails
GROUP BY productcode;

SELECT paymentDate, max(amount), min(amount) 
FROM payments
GROUP BY paymentDate
HAVING paymentDate= '2003-12-09';