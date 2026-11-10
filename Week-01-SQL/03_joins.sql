-- Q1. INNER JOIN
-- Display employees with their department names

SELECT
    e.emp_id,
    e.name,
    d.dept_name
FROM employees e
INNER JOIN departments d
    ON e.dept_id = d.dept_id;


-- Q2. LEFT JOIN
-- Display all employees, including those
-- without a department

SELECT
    e.emp_id,
    e.name,
    d.dept_name
FROM employees e
LEFT JOIN departments d
    ON e.dept_id = d.dept_id;


-- Q3. RIGHT JOIN
-- Display all departments, including those
-- without employees

SELECT
    e.name,
    d.dept_name
FROM employees e
RIGHT JOIN departments d
    ON e.dept_id = d.dept_id;


-- Q4. FULL OUTER JOIN
-- Display all employees and all departments

SELECT
    e.name,
    d.dept_name
FROM employees e
FULL OUTER JOIN departments d
    ON e.dept_id = d.dept_id;


-- Q5. Employees with their department and salary

SELECT
    e.name,
    d.dept_name,
    e.salary
FROM employees e
INNER JOIN departments d
    ON e.dept_id = d.dept_id
ORDER BY e.salary DESC;


-- Q6. Count employees in each department
-- Include departments with zero employees

SELECT
    d.dept_name,
    COUNT(e.emp_id) AS total_employees
FROM departments d
LEFT JOIN employees e
    ON d.dept_id = e.dept_id
GROUP BY d.dept_name
ORDER BY d.dept_name;
