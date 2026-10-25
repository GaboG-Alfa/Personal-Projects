USE classicmodels;
SELECT paymentDate,round(sum(amount),1) as total_payments
FROM payments
GROUP BY paymentDate
HAVING total_payments > 50000 AND paymentDate > '2003-06-01'
ORDER BY paymentDate