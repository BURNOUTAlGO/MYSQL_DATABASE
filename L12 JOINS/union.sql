-- ====================================================================
-- SQL UNION COMPLETE NOTES (HINGLISH)
-- ====================================================================


-- --------------------------------------------------
-- 1. UNION KYA HOTA HAI
-- --------------------------------------------------

-- UNION SQL ka operator hai jo multiple SELECT queries ke result ko
-- combine karke ek single result set banata hai.

-- Ye rows ko vertically combine karta hai
-- matlab ek query ke result ko dusri query ke upar stack karta hai.

-- Important Rules:
-- 1. Dono queries me same number of columns hone chahiye
-- 2. Column data types compatible hone chahiye
-- 3. Final result me column names first SELECT se aate hain
-- 4. Default UNION duplicate rows hata deta hai

-- Agar duplicates bhi chahiye ho to UNION ALL use karte hain.


-- --------------------------------------------------
-- 2. DATABASE CREATE KARNA
-- --------------------------------------------------

CREATE DATABASE union_demo;
USE union_demo;


-- --------------------------------------------------
-- 3. EMPLOYEE TABLES CREATE KARNA
-- --------------------------------------------------

-- Headquarter employees table

CREATE TABLE headquarters_employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    hire_date DATE,
    department VARCHAR(50),
    salary DECIMAL(10,2)
);


-- Branch employees table

CREATE TABLE branch_employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    hire_date DATE,
    department VARCHAR(50),
    salary DECIMAL(10,2)
);


-- Customers table

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    signup_date DATE,
    status VARCHAR(20)
);


-- --------------------------------------------------
-- 4. SAMPLE DATA INSERT KARNA
-- --------------------------------------------------

-- Headquarters employees

INSERT INTO headquarters_employees VALUES
(101, 'John', 'Smith', 'john.smith@company.com', '2018-03-15', 'IT', 75000.00),
(102, 'Mary', 'Johnson', 'mary.johnson@company.com', '2019-06-22', 'HR', 65000.00),
(103, 'Robert', 'Williams', 'robert.williams@company.com', '2017-11-08', 'Finance', 82000.00),
(104, 'Susan', 'Brown', 'susan.brown@company.com', '2020-01-30', 'Marketing', 68000.00),
(105, 'Michael', 'Davis', 'michael.davis@company.com', '2018-09-12', 'IT', 78000.00);


-- Branch employees

INSERT INTO branch_employees VALUES
(201, 'James', 'Wilson', 'james.wilson@company.com', '2019-04-18', 'Sales', 62000.00),
(202, 'Patricia', 'Moore', 'patricia.moore@company.com', '2020-07-25', 'Marketing', 59000.00),
(203, 'Linda', 'Taylor', 'linda.taylor@company.com', '2018-08-15', 'HR', 61000.00),
(204, 'Robert', 'Williams', 'robert.williams@company.com', '2017-11-08', 'Finance', 82000.00),
(205, 'Elizabeth', 'Anderson', 'elizabeth.anderson@company.com', '2019-12-03', 'Sales', 64000.00);


-- Customers data

INSERT INTO customers VALUES
(1001, 'David', 'Miller', 'david.miller@email.com', '2019-02-14', 'Active'),
(1002, 'Sarah', 'Wilson', 'sarah.wilson@email.com', '2020-05-20', 'Active'),
(1003, 'Michael', 'Davis', 'michael.davis@email.com', '2018-11-30', 'Inactive'),
(1004, 'Jennifer', 'Garcia', 'jennifer.garcia@email.com', '2021-01-05', 'Active'),
(1005, 'Robert', 'Martinez', 'robert.martinez@email.com', '2019-08-22', 'Active');


-- --------------------------------------------------
-- 5. TABLE DATA CHECK KARNA
-- --------------------------------------------------

SELECT * FROM headquarters_employees;
SELECT * FROM branch_employees;
SELECT * FROM customers;


-- --------------------------------------------------
-- 6. BASIC UNION EXAMPLE
-- --------------------------------------------------

-- Dono locations ke employees ko combine karna
-- UNION duplicates remove karega

SELECT first_name, last_name, email
FROM headquarters_employees

UNION

SELECT first_name, last_name, email
FROM branch_employees;


-- --------------------------------------------------
-- 7. UNION ALL EXAMPLE
-- --------------------------------------------------

-- Same query but duplicates bhi aayenge

SELECT first_name, last_name, email
FROM headquarters_employees

UNION ALL

SELECT first_name, last_name, email
FROM branch_employees;


-- --------------------------------------------------
-- 8. FULL TABLE UNION
-- --------------------------------------------------

SELECT *
FROM headquarters_employees

UNION ALL

SELECT *
FROM branch_employees;


-- --------------------------------------------------
-- 9. EMPLOYEE + CUSTOMER CONTACT LIST
-- --------------------------------------------------

-- Yaha ek extra column add kar rahe hain
-- taaki pata chale record employee hai ya customer

SELECT 
first_name,
last_name,
email,
'Employee' AS contact_type
FROM headquarters_employees

UNION

SELECT 
first_name,
last_name,
email,
'Customer' AS contact_type
FROM customers;


-- --------------------------------------------------
-- 10. UNION WITH ORDER BY
-- --------------------------------------------------

-- Employees ko last name ke according sort karna

SELECT employee_id, first_name, last_name, department
FROM headquarters_employees

UNION

SELECT employee_id, first_name, last_name, department
FROM branch_employees

ORDER BY last_name;


-- --------------------------------------------------
-- 11. FILTERING BEFORE UNION
-- --------------------------------------------------

-- Sirf high salary employees

SELECT employee_id, first_name, last_name, department, salary
FROM headquarters_employees
WHERE salary > 70000

UNION

SELECT employee_id, first_name, last_name, department, salary
FROM branch_employees
WHERE salary > 70000

ORDER BY salary DESC;


-- --------------------------------------------------
-- 12. DIFFERENT TABLE STRUCTURE HANDLE KARNA
-- --------------------------------------------------

-- Yaha NULL use karke columns align kiye gaye hain

SELECT employee_id, first_name, last_name, department, salary, NULL AS status
FROM headquarters_employees

UNION

SELECT customer_id, first_name, last_name, NULL, NULL, status
FROM customers

ORDER BY first_name, last_name;


-- --------------------------------------------------
-- 13. UNIQUE DEPARTMENTS FIND KARNA
-- --------------------------------------------------

SELECT department
FROM headquarters_employees

UNION

SELECT department
FROM branch_employees;


-- --------------------------------------------------
-- 14. COMMON DEPARTMENTS FIND KARNA
-- --------------------------------------------------

SELECT department 
FROM (
    SELECT DISTINCT department
    FROM headquarters_employees

    UNION ALL

    SELECT DISTINCT department
    FROM branch_employees
) AS combined

GROUP BY department
HAVING COUNT(*) = 2;


-- --------------------------------------------------
-- IMPORTANT NOTES
-- --------------------------------------------------

-- UNION
-- duplicate rows remove karta hai

-- UNION ALL
-- duplicate rows bhi allow karta hai

-- Dono queries me:
-- same number of columns
-- compatible data types
-- hona zaroori hai


-- ---------------- END OF UNION NOTES ----------------