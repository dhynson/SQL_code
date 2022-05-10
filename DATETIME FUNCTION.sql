/*DATETIME FUNCTION*/

-- Display first_name, hire_date, hire_date plus 10 days, hire_date plus 1 month, difference in days between current date and hire_date
SELECT first_name, hire_date, DATEADD(DAY,10,hire_date) AS hire_date_PLUS_10D ,DATEADD(MONTH,1,hire_date) AS hire_date_PLUS_1M, DATEDIFF(DAY,GETDATE(),hire_date) AS DIFF_hire_date_CURRENT
FROM employees;

-- Display the first_name, last_name, birth_date, and age for each employee
SELECT first_name, last_name, birth_date, DATEDIFF(YEAR,birth_date, GETDATE()) AS age
FROM employees;

-- Display the first_name, last_name, and birth_date for employees who were born on the same day and month as today.
SELECT first_name, last_name, birth_date, CONCAT(STR(MONTH(GETDATE())), '-', STR(DAY(GETDATE()))), CONCAT(STR(MONTH(birth_date)), '-', STR(DAY(birth_date)))
FROM employees
WHERE CONCAT(STR(MONTH(GETDATE())), '-', STR(DAY(GETDATE()))) = CONCAT(STR(MONTH(birth_date)), '-', STR(DAY(birth_date)));