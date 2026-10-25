use classicmodels;
with main_cte as
(
select
t1.ordernumber,
orderdate,
quantityordered,
productname,
productline,
case when quantityordered > 40 and productline = 'Motorcycles' then 1
else 0 end as ordered_over_40_motorcycles
from classicmodels.orders t1
join classicmodels.orderdetails t2 on t1.ordernumber = t2.ordernumber
join classicmodels.products t3 on t2.productcode = t3.productcode
)
select orderdate, sum(
ordered_over_40_motorcycles) as over_40_bike_sale
from main_cte
group by orderdate