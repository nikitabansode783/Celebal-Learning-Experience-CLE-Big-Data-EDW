-- Q1. Display previous employee salary

SELECT
    name,
    salary,
    LAG(salary) OVER(
        ORDER BY emp_id
    ) AS previous_salary
FROM employees;


-- Q2. Compare current salary with previous salary

SELECT
    name,
    salary,
    LAG(salary) OVER(
        ORDER BY emp_id
    ) AS previous_salary,
    salary - LAG(salary) OVER(
        ORDER BY emp_id
    ) AS salary_difference
FROM employees;

-- Q3. Calculate running average salary

SELECT
    name,
    salary,
    AVG(salary) OVER(
        ORDER BY emp_id
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS running_average
FROM employees;


-- Q4. Compare employee salary with previous employee in the same department

SELECT
    name,
    dept_id,
    salary,
    LAG(salary) OVER(
        PARTITION BY dept_id
        ORDER BY emp_id
    ) AS previous_dept_salary
FROM employees;

-- Q5. Calculate cumulative payroll percentage of the entire company

SELECT
    name,
    salary,
    ROUND(
        100.0 * SUM(salary) OVER(
            ORDER BY emp_id
            ROWS BETWEEN UNBOUNDED PRECEDING
            AND CURRENT ROW
        ) / SUM(salary) OVER(),
        2
    ) AS cumulative_payroll_percentage
FROM employees;