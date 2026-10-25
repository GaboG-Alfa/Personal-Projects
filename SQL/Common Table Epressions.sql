USE classicmodels;

with cte_orders as

(SELECT  orderDate,count(orderNumber) orders
FROM orders
GROUP BY orderDate),

cte_payments as
(SELECT *
FROM payments)

SELECT AVG(orders)
FROM cte_orders
WHERE orderdate > '2005-05-01'