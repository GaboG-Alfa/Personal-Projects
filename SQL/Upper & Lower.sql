SELECT * 
FROM employees
where lower(firstName) = 'leslie';

SELECT *
FROM employees
WHERE  upper (email) = 'mpatterso@classicmodelcars.com';

SELECT *, upper(firstName) as uppercasename
FROM employees