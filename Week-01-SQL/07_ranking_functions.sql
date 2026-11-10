-- Q1. ROW_NUMBER: Rank all employees according to salary

SELECT
    name,
    salary,
    ROW_NUMBER() OVER(
        ORDER BY salary DESC, emp_id
    ) AS row_num
FROM employees;

-- Q2. DENSE_RANK: Rank employees by salary

SELECT
    name,
    salary,
    DENSE_RANK() OVER(
        ORDER BY salary DESC
    ) AS dense_rank
FROM employees;

-- Q3. Find the highest-paid employee in each department

WITH ranked_employees AS (
    SELECT
        name,
        dept_id,
        salary,
        DENSE_RANK() OVER(
            PARTITION BY dept_id
            ORDER BY salary DESC
        ) AS salary_rank
    FROM employees
    WHERE dept_id IS NOT NULL
)
SELECT *
FROM ranked_employees
WHERE salary_rank = 1;

-- Q4. Find the top 2 employees in each department

WITH ranked_employees AS (
    SELECT
        name,
        dept_id,
        salary,
        ROW_NUMBER() OVER(
            PARTITION BY dept_id
            ORDER BY salary DESC, emp_id
        ) AS row_num
    FROM employees
    WHERE dept_id IS NOT NULL
)
SELECT *
FROM ranked_employees
WHERE row_num <= 2;

-- Q5. Find employees with the same salary

SELECT
    name,
    salary,
    COUNT(*) OVER(
        PARTITION BY salary
    ) AS employees_with_same_salary
FROM employees;