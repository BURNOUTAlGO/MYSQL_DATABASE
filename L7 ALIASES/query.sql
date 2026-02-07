-- =============================================
-- MySQL Aliases Tutorial – COMPLETE GITHUB NOTES
-- =============================================
-- Aliases are temporary names for columns, tables, or expressions
-- used to improve readability of SQL queries.

-- =============================================
-- 1. Database and Table Setup
-- =============================================

CREATE DATABASE db16;
USE db16;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);

INSERT INTO employees VALUES
(1, 'John', 'Doe', 60000.00, '2020-01-15'),
(2, 'Jane', 'Smith', 65000.00, '2019-11-20'),
(3, 'Mike', 'Johnson', 55000.00, '2021-03-10');

-- =============================================
-- 2. View All Employees
-- =============================================

SELECT * FROM employees;

-- Output:
-- emp_id | first_name | last_name | salary  | hire_date
-- 1      | John       | Doe       | 60000.00| 2020-01-15
-- 2      | Jane       | Smith     | 65000.00| 2019-11-20
-- 3      | Mike       | Johnson   | 55000.00| 2021-03-10


-- =============================================
-- 3. Column Alias (AS)
-- =============================================
-- Creating full name using column alias

SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;

-- Output:
-- full_name
-- John Doe
-- Jane Smith
-- Mike Johnson


-- =============================================
-- 4. Departments Table Setup
-- =============================================

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO departments VALUES
(1, 'Engineering', 'New York'),
(2, 'Marketing', 'Los Angeles'),
(3, 'Finance', 'Chicago');

-- Reference departments table
-- dept_id | dept_name     | location
-- 1       | Engineering   | New York
-- 2       | Marketing     | Los Angeles
-- 3       | Finance       | Chicago


-- =============================================
-- 5. Alter Table (Add Foreign Key Column)
-- =============================================

ALTER TABLE employees ADD COLUMN department_id INT;

-- Manually assign departments (for demo clarity)
UPDATE employees SET department_id = 1 WHERE emp_id = 1;
UPDATE employees SET department_id = 2 WHERE emp_id = 2;
UPDATE employees SET department_id = 3 WHERE emp_id = 3;


-- =============================================
-- 6. Table Aliases with JOIN
-- =============================================

SELECT 
    e.first_name,
    e.last_name,
    d.dept_name
FROM employees AS e
JOIN departments AS d
ON e.department_id = d.dept_id;

-- Output:
-- first_name | last_name | dept_name
-- John       | Doe       | Engineering
-- Jane       | Smith     | Marketing
-- Mike       | Johnson   | Finance


-- =============================================
-- 7. Aliases in Subqueries
-- =============================================

SELECT avg_salary.average_salary
FROM (
    SELECT AVG(salary) AS average_salary
    FROM employees
) AS avg_salary;

-- Output:
-- average_salary
-- 60000.00
