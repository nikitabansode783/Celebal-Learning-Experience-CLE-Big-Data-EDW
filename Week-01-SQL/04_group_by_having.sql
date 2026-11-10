-- Q1. Count employees in each department

SELECT
    dept_id,
    COUNT(*) AS total_employees
FROM employees
WHERE dept_id IS NOT NULL
GROUP BY dept_id;


-- Q2. Calculate total salary per department

SELECT
    dept_id,
    SUM(salary) AS total_salary
FROM employees
WHERE dept_id IS NOT NULL
GROUP BY dept_id;


-- Q3. Calculate average salary per department

SELECT
    dept_id,
    AVG(salary) AS average_salary
FROM employees
WHERE dept_id IS NOT NULL
GROUP BY dept_id;


-- Q4. Find highest salary in each department

SELECT
    dept_id,
    MAX(salary) AS highest_salary
FROM employees
WHERE dept_id IS NOT NULL
GROUP BY dept_id;


-- Q5. Find lowest salary in each department

SELECT
    dept_id,
    MIN(salary) AS lowest_salary
FROM employees
WHERE dept_id IS NOT NULL
GROUP BY dept_id;