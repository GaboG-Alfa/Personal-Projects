USE classicmodels;
SELECT DISTINCT orderdate
FROM classicmodels.orders
order by orderdate;

SELECT *
FROM orders
WHERE lower(comments) LIKE '%NEGOTIATE%';