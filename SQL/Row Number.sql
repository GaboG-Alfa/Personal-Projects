use classicmodels;
with main_cte as 
(
select distinct
t3.customername,
t1.customernumber,
t1.ordernumber,
orderdate,

row_number() over (partition by t3.customernumber,t1.ordernumber order by orderdate) as
purchase_number
from classicmodels.orders t1
join classicmodels.customers t3 on t1.customernumber = t3.customernumber
order by customername
)
select * 
from main_cte
where purchase_number = 2