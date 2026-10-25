SELECT A.customerName,B.amount, B.paymentDate
FROM classicmodels.customers A
INNER JOIN classicmodels.payments B
ON A.customerNumber = B.customerNumber;

SELECT A.customerName,B.amount, B.paymentDate
FROM classicmodels.customers A
LEFT JOIN classicmodels.payments B
ON A.customerNumber = B.customerNumber
WHERE B.customerNumber IS NULL;

SELECT A.customerName,B.amount, B.paymentDate
FROM classicmodels.customers A
RIGHT JOIN classicmodels.payments B
ON A.customerNumber = B.customerNumber;