Use classicmodels;

with cte_main as
(
Select orderdate,t1.ordernumber,salesrepemployeenumber,
row_number() over (partition by salesrepemployeenumber order by orderdate) as repordernumber

from orders t1
inner join customers t2
on t1.customernumber = t2.customernumber
join employees t3
on t2.salesRepEmployeeNumber = t3.employeeNumber)

Select *
from cte_main
where repordernumber = 2