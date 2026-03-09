-- ====================================================================
-- SQL UPDATE QUERY COMPLETE NOTES (HINGLISH)
-- ====================================================================


-- --------------------------------------------------
-- 1. UPDATE KYA HOTA HAI
-- --------------------------------------------------

-- UPDATE SQL command existing records ko modify karne ke liye use hota hai.

-- Syntax:
-- UPDATE table_name
-- SET column_name = new_value
-- WHERE condition;


-- --------------------------------------------------
-- 2. DATABASE CREATE KARNA
-- --------------------------------------------------

CREATE DATABASE store_inventory;
USE store_inventory;


-- --------------------------------------------------
-- 3. PRODUCTS TABLE CREATE KARNA
-- --------------------------------------------------

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    category VARCHAR(20),
    price DECIMAL(10,2),
    stock_quantity INT,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- --------------------------------------------------
-- 4. INITIAL DATA INSERT KARNA
-- --------------------------------------------------

INSERT INTO products (product_id, product_name, category, price, stock_quantity)
VALUES
(1,'Laptop','Electronics',899.99,25),
(2,'Desk Chair','Furniture',149.50,40),
(3,'Coffee Maker','Appliances',79.99,15),
(4,'Headphones','Electronics',129.99,30),
(5,'Desk Lamp','Furniture',24.99,50);


-- --------------------------------------------------
-- INITIAL TABLE DATA
-- --------------------------------------------------

SELECT * FROM products;

-- OUTPUT
-- product_id | product_name | category | price | stock_quantity
-- 1 | Laptop | Electronics | 899.99 | 25
-- 2 | Desk Chair | Furniture | 149.50 | 40
-- 3 | Coffee Maker | Appliances | 79.99 | 15
-- 4 | Headphones | Electronics | 129.99 | 30
-- 5 | Desk Lamp | Furniture | 24.99 | 50


-- --------------------------------------------------
-- 5. APPLY 10% DISCOUNT TO ALL PRODUCTS
-- --------------------------------------------------

UPDATE products
SET price = price * 0.9
WHERE product_id > 0;


SELECT * FROM products;

-- OUTPUT (approx)
-- Laptop → 809.99
-- Desk Chair → 134.55
-- Coffee Maker → 71.99
-- Headphones → 116.99
-- Desk Lamp → 22.49


-- --------------------------------------------------
-- 6. UPDATE SPECIFIC PRODUCT PRICE
-- --------------------------------------------------

UPDATE products
SET price = 999.99
WHERE product_id = 1;


SELECT * FROM products WHERE product_id = 1;

-- OUTPUT
-- 1 | Laptop | Electronics | 999.99 | 25


-- --------------------------------------------------
-- 7. UPDATE MULTIPLE COLUMNS
-- --------------------------------------------------

UPDATE products
SET price = 89.99,
stock_quantity = 20
WHERE product_id = 3;


SELECT * FROM products WHERE product_id = 3;

-- OUTPUT
-- 3 | Coffee Maker | Appliances | 89.99 | 20


-- --------------------------------------------------
-- 8. ENABLE AUTO UPDATE TIMESTAMP
-- --------------------------------------------------

ALTER TABLE products
MODIFY last_updated TIMESTAMP
DEFAULT CURRENT_TIMESTAMP
ON UPDATE CURRENT_TIMESTAMP;


-- --------------------------------------------------
-- 9. UPDATE LAPTOP PRICE AND STOCK
-- --------------------------------------------------

UPDATE products
SET price = 199,
stock_quantity = 1
WHERE product_id = 1;


SELECT * FROM products WHERE product_id = 1;

-- OUTPUT
-- 1 | Laptop | Electronics | 199 | 1


-- --------------------------------------------------
-- 10. UPDATE LIMITED ROWS
-- --------------------------------------------------

UPDATE products
SET price = price * 0.1
WHERE product_id > 0
LIMIT 2;


SELECT * FROM products;

-- OUTPUT (first two rows discounted heavily)
-- product_id | price
-- 1 | 19.9
-- 2 | 13.4
-- other rows unchanged


-- --------------------------------------------------
-- 11. PRIMARY KEY UPDATE ATTEMPT
-- --------------------------------------------------

UPDATE products
SET product_id = 1
WHERE product_id = 2;

-- OUTPUT
-- ERROR: Duplicate entry '1' for key 'PRIMARY'


-- --------------------------------------------------
-- FINAL TABLE STATE
-- --------------------------------------------------

SELECT * FROM products;


-- --------------------------------------------------
-- IMPORTANT NOTES
-- --------------------------------------------------

-- UPDATE bina WHERE clause ke use karoge to
-- saare records change ho jayenge.

-- Primary key change karte waqt
-- duplicate constraint error aa sakta hai.