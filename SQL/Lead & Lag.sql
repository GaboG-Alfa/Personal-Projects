with cte_main as
(
SELECT customernumber,
paymentdate,
amount,

lag(amount) over (partition by customernumber order by
paymentdate) as prev_payment

FROM classicmodels.payments)

select *, amount - prev_payment as difference
from cte_main