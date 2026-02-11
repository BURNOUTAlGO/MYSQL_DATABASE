/*
===========================================
SQL FUNCTIONS DEMO – STRING FUNCTIONS
Complete GitHub Notes with Output
===========================================
*/

-- =================
-- STRING FUNCTIONS
-- =================

CREATE DATABASE StringFunctionsDB;
USE StringFunctionsDB;

CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    department VARCHAR(50)
);

INSERT INTO employees (first_name, last_name, email, department) VALUES
('John', 'Doe', 'john.doe@example.com', 'Marketing'),
('Jane', 'Smith', 'jane.smith@example.com', 'Sales'),
('Michael', 'Johnson', 'michael.johnson@example.com', 'IT'),
('Emily', 'Davis', 'emily.davis@example.com', 'HR'),
('Chris', 'Brown', 'chris.brown@example.com', 'Finance');


-- View All Employees
SELECT * FROM employees;

-- Output:
-- emp_id | first_name | last_name | email                        | department
-- 1 | John    | Doe     | john.doe@example.com         | Marketing
-- 2 | Jane    | Smith   | jane.smith@example.com       | Sales
-- 3 | Michael | Johnson | michael.johnson@example.com  | IT
-- 4 | Emily   | Davis   | emily.davis@example.com      | HR
-- 5 | Chris   | Brown   | chris.brown@example.com      | Finance


-- CONCAT
SELECT CONCAT(first_name,' ',last_name) AS full_name FROM employees;

-- Output:
-- full_name
-- John Doe
-- Jane Smith
-- Michael Johnson
-- Emily Davis
-- Chris Brown


-- LENGTH
SELECT first_name, LENGTH(first_name) AS name_length FROM employees;

-- Output:
-- first_name | name_length
-- John       | 4
-- Jane       | 4
-- Michael    | 7
-- Emily      | 5
-- Chris      | 5


-- UPPER & LOWER
SELECT first_name,
       UPPER(first_name) AS uppercase,
       LOWER(first_name) AS lowercase
FROM employees;

-- Output:
-- first_name | uppercase | lowercase
-- John       | JOHN      | john
-- Jane       | JANE      | jane
-- Michael    | MICHAEL   | michael
-- Emily      | EMILY     | emily
-- Chris      | CHRIS     | chris


-- TRIM
SELECT TRIM(UPPER('      ok.   ')) AS trimmed_sample;

-- Output:
-- trimmed_sample
-- OK.


-- SUBSTRING
SELECT first_name,
       SUBSTRING(first_name,1,3) AS first_three_chars
FROM employees;

-- Output:
-- first_name | first_three_chars
-- John       | Joh
-- Jane       | Jan
-- Michael    | Mic
-- Emily      | Emi
-- Chris      | Chr


-- LOCATE 'a'
SELECT first_name,
       LOCATE('a', first_name) AS position_of_a
FROM employees;

-- Output:
-- first_name | position_of_a
-- John       | 0
-- Jane       | 2
-- Michael    | 4
-- Emily      | 0
-- Chris      | 0


-- LOCATE 'ch'
SELECT first_name,
       LOCATE('ch', first_name) AS position_of_ch
FROM employees;

-- Output:
-- first_name | position_of_ch
-- John       | 0
-- Jane       | 0
-- Michael    | 0
-- Emily      | 0
-- Chris      | 1


-- REPLACE
SELECT first_name,
       REPLACE(email,'example.com','amazon.com') AS new_email
FROM employees;

-- Output:
-- first_name | new_email
-- John       | john.doe@amazon.com
-- Jane       | jane.smith@amazon.com
-- Michael    | michael.johnson@amazon.com
-- Emily      | emily.davis@amazon.com
-- Chris      | chris.brown@amazon.com


-- REVERSE
SELECT first_name,
       REVERSE(first_name) AS reversed_name
FROM employees;

-- Output:
-- first_name | reversed_name
-- John       | nhoJ
-- Jane       | enaJ
-- Michael    | leahciM
-- Emily      | ylimE
-- Chris      | sirhC


-- LEFT & RIGHT
SELECT first_name,
       LEFT(first_name,2) AS first_two,
       RIGHT(first_name,2) AS last_two
FROM employees;

-- Output:
-- first_name | first_two | last_two
-- John       | Jo        | hn
-- Jane       | Ja        | ne
-- Michael    | Mi        | el
-- Emily      | Em        | ly
-- Chris      | Ch        | is


-- ASCII
SELECT first_name,
       ASCII(first_name) AS ascii_value,
       ASCII(LOWER(first_name)) AS ascii_lowercase_value
FROM employees;

-- Output:
-- first_name | ascii_value | ascii_lowercase_value
-- John       | 74          | 106
-- Jane       | 74          | 106
-- Michael    | 77          | 109
-- Emily      | 69          | 101
-- Chris      | 67          | 99


-- ============================================
-- FIELD FUNCTION SECTION
-- ============================================

CREATE DATABASE db12;
USE db12;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT,
    last_updated TIMESTAMP
);

INSERT INTO products VALUES
(1, 'Laptop Pro', 'Electronics', 1299.99, 50, '2024-01-15 10:00:00'),
(2, 'Desk Chair', 'Furniture', 199.99, 30, '2024-01-16 11:30:00'),
(3, 'Coffee Maker', 'Appliances', 79.99, 100, '2024-01-14 09:15:00'),
(4, 'Gaming Mouse', 'Electronics', 59.99, 200, '2024-01-17 14:20:00'),
(5, 'Bookshelf', 'Furniture', 149.99, 25, '2024-01-13 16:45:00');

SELECT *,
       FIELD(category,'Electronics','Appliances','Furniture') AS category_order
FROM products
ORDER BY FIELD(category,'Electronics','Appliances','Furniture') DESC;

-- Output:
-- product_id | product_name  | category     | price   | stock_quantity | last_updated           | category_order
-- 2 | Desk Chair   | Furniture   | 199.99  | 30  | 2024-01-16 11:30:00 | 3
-- 5 | Bookshelf    | Furniture   | 149.99  | 25  | 2024-01-13 16:45:00 | 3
-- 3 | Coffee Maker | Appliances  | 79.99   | 100 | 2024-01-14 09:15:00 | 2
-- 1 | Laptop Pro   | Electronics | 1299.99 | 50  | 2024-01-15 10:00:00 | 1
-- 4 | Gaming Mouse | Electronics | 59.99   | 200 | 2024-01-17 14:20:00 | 1


-- ============================================
-- LENGTH vs CHAR_LENGTH
-- ============================================

SELECT LENGTH('hello') AS length_in_bytes;

-- Output:
-- length_in_bytes
-- 5


SELECT LENGTH('こんにちは') AS multibyte_length;

-- Output:
-- multibyte_length
-- 15


SELECT CHAR_LENGTH('hello') AS char_count;

-- Output:
-- char_count
-- 5


SELECT CHAR_LENGTH('こんにちは') AS multibyte_char_count;

-- Output:
-- multibyte_char_count
-- 5


-- ============================================
-- SOUNDEX
-- ============================================

SELECT SOUNDEX('Smith') AS smith_soundex;

-- Output:
-- smith_soundex
-- S530


SELECT SOUNDEX('Smyth') AS smyth_soundex;

-- Output:
-- smyth_soundex
-- S530


SELECT SOUNDEX('Robert') AS robert_soundex;

-- Output:
-- robert_soundex
-- R163


SELECT SOUNDEX('Rupert') AS rupert_soundex;

-- Output:
-- rupert_soundex
-- R163


-- SOUNDEX Search
SELECT * FROM employees 
WHERE SOUNDEX('jane') = SOUNDEX(first_name);

-- Output:
-- emp_id | first_name | last_name | email                      | department
-- 2 | Jane | Smith | jane.smith@example.com | Sales
