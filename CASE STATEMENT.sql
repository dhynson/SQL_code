/* CASE STATEMENT*/

-- Grade Query
SELECT first_name, last_name, salary,
CASE WHEN salary BETWEEN 0 AND 500 THEN 'A'
WHEN salary BETWEEN 5001 AND 15000 THEN 'B'
WHEN salary BETWEEN 15001 AND 20000 THEN 'C'
ELSE 'D'
END AS 'sal_grades'
FROM employees;

-- Age range
SELECT first_name, last_name, birth_date,
TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) AS 'age',
CASE WHEN TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) BETWEEN 0 AND 20 THEN '0-20'
WHEN TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) BETWEEN 21 AND 40 THEN '21-40'
WHEN TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) BETWEEN 21 AND 40 THEN '41-60'
ELSE '60+'
END AS 'age_grades'
FROM employees;