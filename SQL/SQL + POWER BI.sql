USE classicmodels;

CREATE OR REPLACE VIEW sales_data_for_power_bi AS


SELECT orderdate,
ord.ordernumber,
p.productName,
p.productLine,
cu.customerName,
cu.country as customer_country,
o.country as office_country,
buyPrice,
priceEach,
quantityOrdered,
quantityOrdered * priceEach as sales_value,
quantityOrdered * buyPrice as cost_of_sales
FROM orders ord
INNER JOIN orderdetails orddet
ON ord.orderNumber = orddet.orderNumber
INNER JOIN customers cu
ON ord.customerNumber = cu.customerNumber
INNER JOIN products p
ON orddet.productCode = p.productCode
INNER JOIN employees emp
ON cu.salesRepEmployeeNumber = emp.employeeNumber
INNER JOIN offices o
ON emp.officeCode = o.officeCode