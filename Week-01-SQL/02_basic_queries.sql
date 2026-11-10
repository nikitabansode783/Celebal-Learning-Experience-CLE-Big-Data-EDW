 -- Q1. Display all employee records
SELECT *
FROM employees;


-- Q2. Display only employee names and salaries
SELECT name, salary
FROM employees;


-- Q3. Employees belonging to department 10 or 20
-- with salary greater than 60000
SELECT name, salary, dept_id
FROM employees
WHERE dept_id IN (10, 20)
AND salary > 60000
ORDER BY salary DESC;


-- Q4. Employees whose salary is between 55000 and 75000
SELECT name, salary
FROM employees
WHERE salary BETWEEN 55000 AND 75000;


-- Q5. Employees whose names start with A
SELECT *
FROM employees
WHERE name LIKE 'A%';


-- Q6. Employees who do not have a department
SELECT *
FROM employees
WHERE dept_id IS NULL;


-- Q7. Employees who have a department
SELECT *
FROM employees
WHERE dept_id IS NOT NULL;


-- Q8. Employees earning more than 60000
SELECT name, salary
FROM employees
WHERE salary > 60000
ORDER BY salary DESC;


-- Q9. Display employees in descending salary order
SELECT name, salary
FROM employees
ORDER BY salary DESC;


-- Q10. Display only the top 3 highest-paid employees
SELECT name, salary
FROM employees
ORDER BY salary DESC
LIMIT 3;
