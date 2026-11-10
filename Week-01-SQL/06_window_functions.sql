-- Q1. Calculate overall average salary

SELECT
    name,
    salary,
    AVG(salary) OVER() AS overall_average
FROM employees;


-- Q2. Calculate total salary of all employees

SELECT
    name,
    salary,
    SUM(salary) OVER() AS total_salary
FROM employees;


-- Q3. Calculate department-wise average salary

SELECT
    name,
    dept_id,
    salary,
    AVG(salary) OVER(
        PARTITION BY dept_id
    ) AS department_average
FROM employees;


-- Q4. Calculate department-wise total salary

SELECT
    name,
    dept_id,
    salary,
    SUM(salary) OVER(
        PARTITION BY dept_id
    ) AS department_total
FROM employees;


-- Q5. Calculate department-wise employee count

SELECT
    name,
    dept_id,
    COUNT(*) OVER(
        PARTITION BY dept_id
    ) AS department_employee_count
FROM employees;