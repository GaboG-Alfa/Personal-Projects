USE classicmodels;

with main_cte as (
SELECT t1.ordernumber,
t2.productCode,
t2.quantityOrdered,
t2.priceEach,
quantityOrdered * priceEach as sales_value,
t3.city as customer_city, 
t3.country as customer_country,
t4.productLine,
t6.city as office_city,
t6.country as office_country
FROM orders t1
INNER JOIN orderdetails t2
ON t1.orderNumber = t2.orderNumber
INNER JOIN customers t3
ON t1.customerNumber = t3.customerNumber
INNER JOIN products t4
ON t2.productCode = t4.productCode
INNER JOIN employees t5
ON t3.salesRepEmployeeNumber = t5.employeeNumber
INNER JOIN offices t6
ON t5.officeCode = t6.officeCode
)

SELECT 
ordernumber,
sales_value,
customer_city,
customer_country,
productline,
office_city,
office_country,
sum(sales_value) as sales_value
FROM main_cte
GROUP BY 
ordernumber,
sales_value,
customer_city,
customer_country,
productline,
office_city,
office_country