USE classicmodels;
SELECT DISTINCT country
FROM customers;

SELECT *
FROM customers
WHERE upper(city) LIKE '%New%';

SELECT * 
FROM employees
ORDER BY lastName DESC,firstName DESC