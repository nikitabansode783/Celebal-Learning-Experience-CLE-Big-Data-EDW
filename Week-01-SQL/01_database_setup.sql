-- 1. Create departments table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

-- 2. Create employees table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    dept_id INT,
    salary NUMERIC(10,2) NOT NULL,
    FOREIGN KEY (dept_id)
        REFERENCES departments(dept_id)
);

-- 3. Insert department records
INSERT INTO departments (dept_id, dept_name)
VALUES
(10, 'Engineering'),
(20, 'Data'),
(30, 'Sales'),
(40, 'Support');

-- 4. Insert employee records
INSERT INTO employees (emp_id, name, dept_id, salary)
VALUES
(1, 'Aarav', 10, 90000),
(2, 'Diya', 10, 75000),
(3, 'Kabir', 20, 75000),
(4, 'Meera', 20, 60000),
(5, 'Rohan', 30, 55000),
(6, 'Ishaan', NULL, 50000);

-- 5. Verify departments
SELECT * FROM departments;

-- 6. Verify employees
SELECT * FROM employees;
