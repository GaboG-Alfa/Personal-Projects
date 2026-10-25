Use classicmodels;

WITH sales as (
SELECT t1.ordernumber, t1.customerNumber, productcode,quantityOrdered,priceEach,priceEach * quantityOrdered as sales_value,creditLimit 
FROM orders t1
INNER JOIN orderdetails t2
ON t1.orderNumber = t2.orderNumber
INNER JOIN customers t3
ON t1.customerNumber = t3.customerNumber)

SELECT ordernumber,customernumber, case when creditlimit < 75000 then 'a:Less than $75k' when creditlimit between 75000 and 100000 then 'b:$75k -$100k' when creditlimit between 100000 and 150000 then 'c:$100k - $150k' when creditlimit > 150000 then 'd:Over $150k' else 'Other' end as creditlimit_group, sum(sales_value) as sales_value
FROM sales
GROUP BY ordernumber,customernumber,creditlimit_group;