-- Q1. Basic CTE
-- Display all employees using a CTE

WITH employee_data AS (
    SELECT *
    FROM employees
)
SELECT *
FROM employee_data;


-- Q2. Employees earning more than 60000

WITH high_salary AS (
    SELECT *
    FROM employees
    WHERE salary > 60000
)
SELECT *
FROM high_salary;


-- Q3. Calculate average salary using CTE

WITH avg_salary AS (
    SELECT AVG(salary) AS average
    FROM employees
)
SELECT *
FROM avg_salary;


-- Q4. Find employees earning more than
-- the overall average salary

WITH avg_salary AS (
    SELECT AVG(salary) AS average
    FROM employees
)
SELECT
    name,
    salary
FROM employees
WHERE salary > (
    SELECT average
    FROM avg_salary
);


-- Q5. Calculate department-wise salary

WITH dept_salary AS (
    SELECT
        dept_id,
        SUM(salary) AS total_salary
    FROM employees
    WHERE dept_id IS NOT NULL
    GROUP BY dept_id
)
SELECT *
FROM dept_salary;