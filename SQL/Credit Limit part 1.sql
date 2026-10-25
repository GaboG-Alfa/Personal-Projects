USE classicmodels;

with cte_sales as
(
SELECT orderDate,
t1.customerNumber,
t1.orderNumber,
customerName,
productCode,
creditLimit, 
quantityOrdered * priceEach as sales_value
FROM orders t1
INNER JOIN orderdetails t2
ON t1.orderNumber = t2.orderNumber
INNER JOIN customers t3
ON t1.customerNumber = t3.customerNumber
),

running_total_sales_cte as
(
SELECT *,lead(orderdate) over (partition by customernumber order by orderdate) as next_order_date
FROM
(
SELECT orderdate,
ordernumber,
customernumber,
customername,
creditlimit,
sum(sales_value) as sales_value 
FROM cte_sales
GROUP BY
orderdate,
ordernumber,
customernumber,
customername,
creditlimit
)subquery
),

payments_cte as
(SELECT *, sum(amount) over (partition by customernumber order by paymentdate) as running_total_payments
FROM payments),

main_cte as

(
SELECT t1.*,
sum(sales_value) over (partition by t1.customernumber order by orderdate) as running_total_sales,
sum(amount) over (partition by t1.customernumber order by orderdate) as running_total_payments
FROM running_total_sales_cte t1
LEFT JOIN payments_cte t2
ON t1.customerNumber = t2.customerNumber and t2.paymentdate between t1.orderdate and case when t1.next_order_date is null then current_date else next_order_date end
order by t1.customerNumber,orderdate
)

SELECT *, running_total_sales - running_total_payments as money_owed,
creditlimit - (running_total_sales - running_total_payments) as difference
FROM main_cte