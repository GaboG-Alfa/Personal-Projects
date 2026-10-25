with main_cte as 
(
SELECT orderNumber,sum(quantityOrdered * priceEach) as order_value
FROM classicmodels.orderdetails
GROUP BY orderNumber
)

SELECT min(order_value) as lowest_order , max(order_value) as highest_order, max(order_value) - min(order_value) as "range"
FROM main_cte
