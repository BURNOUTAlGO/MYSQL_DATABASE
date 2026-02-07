-- =============================================
-- MySQL DISTINCT Tutorial – COMPLETE GITHUB NOTES
-- =============================================
-- DISTINCT duplicate rows ko remove karta hai
-- Syntax: SELECT DISTINCT column1, column2 FROM table_name;

-- =============================================
-- 1. Database and Table Setup
-- =============================================

CREATE DATABASE EmployeeDB;
USE EmployeeDB;

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employees (name, department, salary) VALUES
('Alice', 'HR', 50000),
('Bob', 'Finance', 60000),
('Charlie', 'IT', 70000),
('Alice', 'HR', 50000),
('David', 'Finance', 55000),
('Eve', 'IT', 70000),
('Frank', 'HR', 50000);

-- =============================================
-- 2. View All Employees
-- =============================================

SELECT * FROM employees;

-- Output:
-- id | name     | department | salary
-- 1  | Alice    | HR         | 50000
-- 2  | Bob      | Finance    | 60000
-- 3  | Charlie  | IT         | 70000
-- 4  | Alice    | HR         | 50000
-- 5  | David    | Finance    | 55000
-- 6  | Eve      | IT         | 70000
-- 7  | Frank    | HR         | 50000


-- =============================================
-- 3. DISTINCT on Single Column
-- =============================================
-- Get unique departments

SELECT DISTINCT department
FROM employees;

-- Output:
-- department
-- HR
-- Finance
-- IT


-- =============================================
-- 4. DISTINCT on Multiple Columns
-- =============================================
-- Unique department–salary combinations

SELECT DISTINCT department, salary
FROM employees;

-- Output:
-- department | salary
-- HR         | 50000
-- Finance    | 60000
-- IT         | 70000
-- Finance    | 55000


-- =============================================
-- 5. DISTINCT with Aggregate Function
-- =============================================
-- Count unique departments

SELECT COUNT(DISTINCT department) AS unique_departments
FROM employees;

-- Output:
-- unique_departments
-- 3


-- =============================================
-- 6. DISTINCT with String Functions
-- =============================================
-- Unique name-department combinations

SELECT DISTINCT CONCAT(name, '-', department)
FROM employees;

-- Output:
-- CONCAT(name,'-',department)
-- Alice-HR
-- Bob-Finance
-- Charlie-IT
-- David-Finance
-- Eve-IT
-- Frank-HR


-- =============================================
-- 7. DISTINCT with ORDER BY
-- =============================================
-- Unique salaries in descending order

SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC;

-- Output:
-- salary
-- 70000
-- 60000
-- 55000
-- 50000


-- =============================================
-- 8. DISTINCT with WHERE Clause
-- =============================================
-- Unique departments where salary > 50000

SELECT DISTINCT department
FROM employees
WHERE salary > 50000;

-- Output:
-- department
-- Finance
-- IT


-- =============================================
-- 9. Display Current Data
-- =============================================

SELECT * FROM employees;

-- Output:
-- id | name     | department | salary
-- 1  | Alice    | HR         | 50000
-- 2  | Bob      | Finance    | 60000
-- 3  | Charlie  | IT         | 70000
-- 4  | Alice    | HR         | 50000
-- 5  | David    | Finance    | 55000
-- 6  | Eve      | IT         | 70000
-- 7  | Frank    | HR         | 50000


-- =============================================
-- 10. DISTINCT with NULL Values
-- =============================================

INSERT INTO employees (name, department, salary) VALUES
('Grace', NULL, 48000),
('Bobby', NULL, 48000);


SELECT DISTINCT department
FROM employees;

-- Output:
-- department
-- HR
-- Finance
-- IT
-- NULL
