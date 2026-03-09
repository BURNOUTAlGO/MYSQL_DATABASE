-- ====================================================================
-- SQL DELETE QUERY COMPLETE NOTES (HINGLISH)
-- ====================================================================


-- --------------------------------------------------
-- 1. DELETE KYA HOTA HAI
-- --------------------------------------------------

-- DELETE SQL command table ke records remove karne ke liye use hota hai.

-- Syntax:

-- DELETE FROM table_name
-- WHERE condition;

-- Agar WHERE clause nahi lagate to table ke saare rows delete ho jate hain.


-- --------------------------------------------------
-- 2. DATABASE CREATE KARNA
-- --------------------------------------------------

CREATE DATABASE delete_tutorial;
USE delete_tutorial;


-- --------------------------------------------------
-- 3. PRODUCTS TABLE CREATE KARNA
-- --------------------------------------------------

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2),
    stock_quantity INT
);


-- --------------------------------------------------
-- 4. SAMPLE DATA INSERT KARNA
-- --------------------------------------------------

INSERT INTO products VALUES
(1,'Laptop',999.99,10),
(2,'Smartphone',499.99,25),
(3,'Headphones',89.99,50),
(4,'Tablet',349.99,15),
(5,'Keyboard',59.99,30),
(6,'Mouse',29.99,45),
(7,'Monitor',249.99,12),
(8,'Printer',179.99,8),
(9,'External Hard Drive',129.99,20),
(10,'USB Drive',19.99,100);


-- --------------------------------------------------
-- INITIAL DATA CHECK
-- --------------------------------------------------

SELECT * FROM products;

-- OUTPUT
-- 1 Laptop
-- 2 Smartphone
-- 3 Headphones
-- 4 Tablet
-- 5 Keyboard
-- 6 Mouse
-- 7 Monitor
-- 8 Printer
-- 9 External Hard Drive
-- 10 USB Drive


-- --------------------------------------------------
-- 5. SPECIFIC RECORD DELETE
-- --------------------------------------------------

DELETE FROM products
WHERE product_id = 10;


SELECT * FROM products;

-- OUTPUT
-- product_id 10 (USB Drive) delete ho chuka hai


-- --------------------------------------------------
-- 6. CONDITION BASED DELETE
-- --------------------------------------------------

-- price < 50 wale products delete karna

DELETE FROM products
WHERE price < 50.00;

SELECT * FROM products;

-- OUTPUT
-- Mouse aur USB drive jaise cheap products remove ho jayenge


-- --------------------------------------------------
-- 7. DELETE ALL RECORDS
-- --------------------------------------------------

DELETE FROM products;

SELECT * FROM products;

-- OUTPUT
-- table empty ho jayegi


-- --------------------------------------------------
-- 8. DATA REINSERT KARNA
-- --------------------------------------------------

INSERT INTO products VALUES
(1,'Laptop',999.99,10),
(2,'Smartphone',499.99,25),
(3,'Headphones',89.99,50),
(4,'Tablet',349.99,15),
(5,'Keyboard',59.99,30),
(6,'Mouse',29.99,45),
(7,'Monitor',249.99,12),
(8,'Printer',179.99,8),
(9,'External Hard Drive',129.99,20),
(10,'USB Drive',19.99,100);


-- --------------------------------------------------
-- 9. EXPENSIVE PRODUCTS SELECT
-- --------------------------------------------------

SELECT * FROM products
WHERE price > 300;

-- OUTPUT
-- Laptop
-- Smartphone
-- Tablet


-- --------------------------------------------------
-- 10. EXPENSIVE PRODUCTS DELETE
-- --------------------------------------------------

DELETE FROM products
WHERE price > 300;

SELECT * FROM products;

-- OUTPUT
-- Laptop, Smartphone, Tablet delete ho jayenge


-- --------------------------------------------------
-- 11. FOREIGN KEY TABLE CREATE
-- --------------------------------------------------

CREATE TABLE orders (
order_id INT PRIMARY KEY,
product_id INT,
quantity INT,
FOREIGN KEY (product_id) REFERENCES products(product_id)
);


-- --------------------------------------------------
-- 12. ORDER INSERT KARNA
-- --------------------------------------------------

INSERT INTO orders VALUES (1,2,3);

SELECT * FROM orders;

-- OUTPUT
-- order_id 1 product_id 2 quantity 3


-- --------------------------------------------------
-- 13. REFERENCED PRODUCT DELETE TRY KARNA
-- --------------------------------------------------

DELETE FROM products WHERE product_id = 2;

-- OUTPUT
-- ERROR: Foreign key constraint fail


-- --------------------------------------------------
-- 14. FOREIGN KEY CASCADE DELETE
-- --------------------------------------------------

ALTER TABLE orders DROP FOREIGN KEY orders_ibfk_1;

ALTER TABLE orders
ADD CONSTRAINT orders_ibfk_1
FOREIGN KEY (product_id)
REFERENCES products(product_id)
ON DELETE CASCADE;


-- Ab product delete karne par related orders bhi delete ho jayenge

DELETE FROM products WHERE product_id = 2;

SELECT * FROM products;
SELECT * FROM orders;


-- --------------------------------------------------
-- 15. FOREIGN KEY SET NULL
-- --------------------------------------------------

INSERT INTO orders VALUES (1,3,2);

ALTER TABLE orders DROP FOREIGN KEY orders_ibfk_1;

ALTER TABLE orders
ADD CONSTRAINT orders_ibfk_1
FOREIGN KEY (product_id)
REFERENCES products(product_id)
ON DELETE SET NULL;


DELETE FROM products WHERE product_id = 3;

SELECT * FROM products;
SELECT * FROM orders;

-- OUTPUT
-- orders table me product_id NULL ho jayega


-- --------------------------------------------------
-- 16. AUTO INCREMENT EXAMPLE
-- --------------------------------------------------

CREATE TABLE auto_example (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50)
);

INSERT INTO auto_example (name)
VALUES ('Item 1'),('Item 2'),('Item 3');

DELETE FROM auto_example;

INSERT INTO auto_example (name)
VALUES ('New Item');

SELECT * FROM auto_example;

-- OUTPUT
-- id reset nahi hota
-- next id previous sequence se continue karega


-- --------------------------------------------------
-- 17. TRUNCATE TABLE DEMO
-- --------------------------------------------------

CREATE TABLE employees (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
email VARCHAR(100) UNIQUE,
hire_date DATE,
salary DECIMAL(10,2)
);

INSERT INTO employees (name,email,hire_date,salary) VALUES
('John Doe','john.doe@example.com','2023-01-15',65000),
('Jane Smith','jane.smith@example.com','2023-02-20',72000),
('Michael Brown','michael.brown@example.com','2023-03-10',58000);

SELECT * FROM employees;


-- TRUNCATE TABLE

TRUNCATE TABLE employees;

SELECT * FROM employees;

-- OUTPUT
-- table empty ho jayegi


-- --------------------------------------------------
-- IMPORTANT DIFFERENCE
-- --------------------------------------------------

-- DELETE
-- rows ek ek karke delete karta hai
-- WHERE clause support karta hai
-- auto increment reset nahi hota

-- TRUNCATE
-- table ko quickly empty karta hai
-- WHERE clause support nahi karta
-- auto increment reset ho jata hai
-- faster hota hai


-- ---------------- END OF DELETE NOTES ----------------