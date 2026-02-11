/*
===========================================
DATE FUNCTIONS + AGGREGATE FUNCTIONS
Complete GitHub Notes with Output
===========================================
*/

-- =================
-- DATE FUNCTIONS
-- =================

-- Current date and time functions

SELECT NOW() AS current_datetime;

-- Output:
-- current_datetime
-- 2025-03-15 12:00:00   (Example output, depends on system time)


SELECT CURDATE() AS current_date;

-- Output:
-- current_date
-- 2025-03-15


SELECT CURTIME() AS current_time;

-- Output:
-- current_time
-- 12:00:00


-- =================
-- Date part extraction
-- =================

SELECT YEAR('2025-03-15 12:34:56') AS current_year;

-- Output:
-- current_year
-- 2025


SELECT MONTH('2025-03-15') AS current_month;

-- Output:
-- current_month
-- 3


SELECT DAY('2025-03-15') AS current_day;

-- Output:
-- current_day
-- 15


SELECT HOUR('2025-03-15 12:34:56') AS current_hour;

-- Output:
-- current_hour
-- 12


SELECT MINUTE('2025-03-15 12:34:56') AS current_minute;

-- Output:
-- current_minute
-- 34


SELECT SECOND('2025-03-15 12:34:56') AS current_second;

-- Output:
-- current_second
-- 56


-- =================
-- Date Formatting
-- =================

SELECT DATE_FORMAT('2025-03-13', '%W, %M %e, %Y') AS formatted_date_long;

-- Output:
-- formatted_date_long
-- Thursday, March 13, 2025


SELECT DATE_FORMAT('2025-03-13', '%e/%m/%Y') AS formatted_date_short;

-- Output:
-- formatted_date_short
-- 13/03/2025


-- =================
-- Date Arithmetic
-- =================

SELECT DATE_ADD('2025-03-13', INTERVAL 7 MONTH) AS date_plus_7_months;

-- Output:
-- date_plus_7_months
-- 2025-10-13


SELECT DATE_SUB('2025-03-13', INTERVAL 7 MONTH) AS date_minus_7_months;

-- Output:
-- date_minus_7_months
-- 2024-08-13


-- =================
-- Date Difference
-- =================

SELECT DATEDIFF('2025-03-10', '2024-03-03') AS days_between;

-- Output:
-- days_between
-- 372


-- =================
-- Unix Timestamp
-- =================

SELECT UNIX_TIMESTAMP('2025-03-03') AS unix_time;

-- Output:
-- unix_time
-- 1740960000


SELECT FROM_UNIXTIME(1741392000) AS readable_date;

-- Output:
-- readable_date
-- 2025-03-08 00:00:00


-- =================
-- Date Example with Table
-- =================

CREATE DATABASE DateExamplesDB;
USE DateExamplesDB;

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    order_date DATETIME
);

INSERT INTO orders (customer_name, order_date) VALUES
('Alice', '2025-03-01 10:15:00'),
('Bob', '2025-03-02 14:45:30'),
('Charlie', '2025-03-03 09:30:15'),
('Akshay', '2024-03-01 10:15:00');

SELECT * FROM orders;

-- Output:
-- order_id | customer_name | order_date
-- 1 | Alice   | 2025-03-01 10:15:00
-- 2 | Bob     | 2025-03-02 14:45:30
-- 3 | Charlie | 2025-03-03 09:30:15
-- 4 | Akshay  | 2024-03-01 10:15:00


SELECT * FROM orders 
WHERE order_date >= DATE_SUB('2025-03-15', INTERVAL 7 DAY);

-- Output:
-- order_id | customer_name | order_date
-- 1 | Alice   | 2025-03-01 10:15:00
-- 2 | Bob     | 2025-03-02 14:45:30
-- 3 | Charlie | 2025-03-03 09:30:15


-- =================
-- AGGREGATE FUNCTIONS
-- =================

CREATE DATABASE CompanyDB2;
USE CompanyDB2;

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);

INSERT INTO employees (name, department, salary, hire_date) VALUES
('Alice', 'HR', 50000, '2018-06-23'),
('Bob', 'IT', 70000, '2019-08-01'),
('Charlie', 'Finance', 80000, '2017-04-15'),
('David', 'HR', 55000, '2020-11-30'),
('Eve', 'IT', 75000, '2021-01-25'),
('Frank', 'Finance', 72000, '2019-07-10'),
('Grace', 'IT', 68000, '2018-09-22'),
('Hank', 'Finance', 90000, '2016-12-05'),
('Ivy', 'HR', 53000, '2022-03-19'),
('Jack', 'IT', 72000, '2017-05-12');

SELECT * FROM employees;

-- Output:
-- id | name    | department | salary | hire_date
-- 1 | Alice   | HR         | 50000  | 2018-06-23
-- 2 | Bob     | IT         | 70000  | 2019-08-01
-- 3 | Charlie | Finance    | 80000  | 2017-04-15
-- 4 | David   | HR         | 55000  | 2020-11-30
-- 5 | Eve     | IT         | 75000  | 2021-01-25
-- 6 | Frank   | Finance    | 72000  | 2019-07-10
-- 7 | Grace   | IT         | 68000  | 2018-09-22
-- 8 | Hank    | Finance    | 90000  | 2016-12-05
-- 9 | Ivy     | HR         | 53000  | 2022-03-19
-- 10| Jack    | IT         | 72000  | 2017-05-12


SELECT COUNT(*) AS hr_employee_count 
FROM employees WHERE department='HR';

-- Output:
-- hr_employee_count
-- 3


SELECT SUM(salary) AS total_hr_salary 
FROM employees WHERE department='HR';

-- Output:
-- total_hr_salary
-- 158000


SELECT AVG(salary) AS avg_hr_salary 
FROM employees WHERE department='HR';

-- Output:
-- avg_hr_salary
-- 52666.67


SELECT MIN(salary) AS min_hr_salary 
FROM employees WHERE department='HR';

-- Output:
-- min_hr_salary
-- 50000


SELECT MAX(salary) AS max_hr_salary 
FROM employees WHERE department='HR';

-- Output:
-- max_hr_salary
-- 55000


SELECT 
    COUNT(*) AS num_employees,
    SUM(salary) AS total_salary,
    AVG(salary) AS average_salary,
    MIN(salary) AS lowest_salary,
    MAX(salary) AS highest_salary
FROM employees;

-- Output:
-- num_employees | total_salary | average_salary | lowest_salary | highest_salary
-- 10            | 685000       | 68500          | 50000         | 90000


SELECT 
    department,
    COUNT(*) AS employee_count,
    SUM(salary) AS department_total_salary,
    ROUND(AVG(salary), 2) AS department_avg_salary,
    MIN(salary) AS department_min_salary,
    MAX(salary) AS department_max_salary
FROM employees
GROUP BY department
ORDER BY department_avg_salary DESC;

-- Output:
-- department | employee_count | department_total_salary | department_avg_salary | department_min_salary | department_max_salary
-- Finance    | 3              | 242000                  | 80666.67              | 72000                 | 90000
-- IT         | 4              | 285000                  | 71250.00              | 68000                 | 75000
-- HR         | 3              | 158000                  | 52666.67              | 50000                 | 55000
