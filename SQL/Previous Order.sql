USE classicmodels;

WITH main_cte as
(SELECT ordernumber,orderdate,customernumber, sum(sales_value) as sales_value
FROM
(SELECT t1.ordernumber, orderdate , customernumber, productcode ,quantityOrdered * priceEach as sales_value
FROM orders t1
INNER JOIN orderdetails t2
ON t1.ordernumber = t2.ordernumber) main
GROUP BY ordernumber,orderdate,customernumber
),

sales_query as
(
SELECT t1.*, customername, row_number() over (partition by customername order by orderdate) as purchase_number,
lag(sales_value) over (partition by customername order by orderdate) as prev_sales_value
FROM main_cte t1
INNER JOIN customers t2
ON t1.customernumber = t2.customernumber)

SELECT *, sales_value - prev_sales_value as purchase_value_change
FROM sales_query
WHERE prev_sales_value IS NOT NULL

