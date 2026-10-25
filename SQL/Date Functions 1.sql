Use classicmodels;

Select a.ordernumber,
requireddate,
orderdate,
datediff(now(),orderdate) days_until_required
from classicmodels.orders a