SELECT *, sum(amount) over (partition by customernumber order by paymentdate) as running_total_payments
FROM payments
WHERE customernumber = 103;
