
# Week 01 – SQL for Data Engineering

## Overview

This week focused on learning SQL fundamentals and advanced querying techniques using PostgreSQL.

A sample employee and department database was created to perform practical SQL exercises.

## Database Design

### Employees Table
- emp_id – Employee ID (Primary Key)
- name – Employee name
- dept_id – Department ID (Foreign Key)
- salary – Employee salary
- manager_id – Reporting manager ID (Self-referencing Foreign Key)

### Departments Table
- dept_id – Department ID (Primary Key)
- dept_name – Department name

## Topics Implemented

| No. | Topic | Practical File |
|---|---|---|
| 1 | Database and Table Creation | 01_database_setup.sql |
| 2 | SELECT and Filtering | 02_basic_queries.sql |
| 3 | SQL JOINs | 03_joins.sql |
| 4 | GROUP BY and HAVING | 04_group_by_having.sql |
| 5 | Common Table Expressions | 05_ctes.sql |
| 6 | Window Functions | 06_window_functions.sql |
| 7 | Ranking Functions | 07_ranking_functions.sql |
| 8 | LAG, LEAD and Running Totals | 08_lag_running_totals.sql |


## Key Practical Challenges

### 1. Direct Reports
Used a self JOIN to identify managers and count their direct reports.

### 2. Second-Highest Salary
Used DENSE_RANK() with PARTITION BY to identify the second-highest distinct salary in each department.

### 3. Department Payroll Share
Used SUM() OVER() to calculate each employee's percentage contribution to department payroll.

## Tools Used

- PostgreSQL 18
- SQL
- Visual Studio Code
- pgAdmin 4

## Execution

1. Create the database using the setup script.
2. Execute the SQL files in numerical order.
3. Verify the query results in pgAdmin.
4. Refer to the evidence folder for execution screenshots.

## Learning Outcomes

- Developed an understanding of SQL querying.
- Practised relational data operations using JOINs.
- Applied aggregation and analytical functions.
- Used CTEs to organize complex queries.
- Implemented ranking and window functions.
- Solved practical business-oriented SQL challenges.

## Output - Snapshots

Screenshots of SQL execution and query outputs are maintained in the Output-SS folder.
