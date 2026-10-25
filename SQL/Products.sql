USE classicmodels;

with prod_sales as
(
SELECT ordernumber, t1.productcode, productline  
FROM orderdetails t1
INNER JOIN products t2
ON t1.productcode = t2.productcode
)

SELECT DISTINCT t1.orderNumber, t1.productLine AS product_one, t2.productLine AS product_two
FROM prod_sales t1
LEFT JOIN prod_sales t2
ON t1.orderNumber = t2.orderNumber AND t1.productline <> t2.productline

