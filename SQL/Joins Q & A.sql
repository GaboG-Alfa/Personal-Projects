-- Exercise 1
SELECT A.contactFirstName,A.contactLastName,O.orderDate,O.status
FROM classicmodels.customers A
INNER JOIN classicmodels.orders O
ON A.customerNumber = O.customerNumber;

-- Exercise 2
SELECT A.contactFirstName,A.contactLastName,O.orderDate,O.orderNumber
FROM classicmodels.customers A
LEFT JOIN classicmodels.orders O
ON A.customerNumber = O.customerNumber
WHERE O.customerNumber IS NULL;

