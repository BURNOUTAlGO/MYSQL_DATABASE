-- ====================================================================
-- SQL REPLACE INTO COMPLETE NOTES (HINGLISH)
-- ====================================================================


-- --------------------------------------------------
-- 1. REPLACE INTO KYA HOTA HAI
-- --------------------------------------------------

-- REPLACE INTO MySQL ka special command hai
-- jo INSERT aur DELETE ka combination hota hai.

-- Agar record already exist karta hai (same PRIMARY KEY / UNIQUE KEY):
-- 1. Old record DELETE hota hai
-- 2. New record INSERT hota hai

-- Agar record exist nahi karta:
-- simple INSERT ho jata hai.

-- Syntax

-- REPLACE INTO table_name(columns)
-- VALUES(values);


-- --------------------------------------------------
-- 2. DATABASE CREATE KARNA
-- --------------------------------------------------

CREATE DATABASE replace_demo;
USE replace_demo;


-- --------------------------------------------------
-- 3. PRODUCTS TABLE CREATE KARNA
-- --------------------------------------------------

CREATE TABLE products (
product_id INT PRIMARY KEY,
product_name VARCHAR(100) NOT NULL,
category VARCHAR(50),
price DECIMAL(10,2),
stock_quantity INT,
last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
ON UPDATE CURRENT_TIMESTAMP
);


-- --------------------------------------------------
-- 4. INITIAL PRODUCT DATA INSERT KARNA
-- --------------------------------------------------

INSERT INTO products (product_id, product_name, category, price, stock_quantity)
VALUES
(1,'Laptop','Electronics',899.99,25),
(2,'Smartphone','Electronics',599.99,50),
(3,'Coffee Maker','Kitchen',79.99,30),
(4,'Running Shoes','Sportswear',129.99,40),
(5,'Desk Chair','Furniture',189.99,15);


SELECT * FROM products;

-- OUTPUT
-- product_id | product_name | category | price | stock_quantity
-- 1 Laptop Electronics 899.99 25
-- 2 Smartphone Electronics 599.99 50
-- 3 Coffee Maker Kitchen 79.99 30
-- 4 Running Shoes Sportswear 129.99 40
-- 5 Desk Chair Furniture 189.99 15


-- --------------------------------------------------
-- 5. EXISTING RECORD REPLACE KARNA
-- --------------------------------------------------

-- ID 5 already exist karta hai
-- to old record delete hoga aur new insert hoga

REPLACE INTO products (product_id, product_name, category, price, stock_quantity)
VALUES
(5,'Mic','Electronics',500,12);


SELECT * FROM products;

-- OUTPUT
-- product_id 5 update ho gaya
-- 5 Mic Electronics 500 12


-- --------------------------------------------------
-- 6. NEW RECORD INSERT USING REPLACE
-- --------------------------------------------------

-- ID 6 exist nahi karta
-- isliye normal INSERT hoga

REPLACE INTO products (product_id, product_name, category, price)
VALUES
(6,'Camera','Electronics',5000);


SELECT * FROM products;

-- OUTPUT
-- new row add ho jayegi
-- 6 Camera Electronics 5000 NULL


-- --------------------------------------------------
-- 7. SECOND TABLE CREATE KARNA
-- --------------------------------------------------

CREATE TABLE products2 (
product_id INT PRIMARY KEY,
product_name VARCHAR(100),
category VARCHAR(50),
price DECIMAL(10,2),
stock_quantity INT,
supplier VARCHAR(100)
);


-- --------------------------------------------------
-- 8. PRODUCTS2 DATA INSERT
-- --------------------------------------------------

INSERT INTO products2 VALUES
(2,'Ultra Smartphone','Electronics',899.99,40,'TechCorp'),
(4,'Pro Running Shoes','Sportswear',149.99,35,'SportMaster'),
(7,'Bluetooth Speaker','Electronics',79.99,60,'SoundWave'),
(8,'Gaming Mouse','Computer Accessories',49.99,100,'GamerZone'),
(9,'Portable Monitor','Electronics',199.99,25,'DisplayTech');


SELECT * FROM products2;

-- OUTPUT
-- 2 Ultra Smartphone
-- 4 Pro Running Shoes
-- 7 Bluetooth Speaker
-- 8 Gaming Mouse
-- 9 Portable Monitor


-- --------------------------------------------------
-- 9. BULK REPLACE USING SELECT
-- --------------------------------------------------

-- Existing IDs (2,4) update honge
-- New IDs (7,8,9) insert honge

REPLACE INTO products (product_id, product_name, category, price, stock_quantity)

SELECT product_id,
product_name,
category,
price,
stock_quantity
FROM products2;


-- --------------------------------------------------
-- FINAL PRODUCTS TABLE
-- --------------------------------------------------

SELECT * FROM products;

-- OUTPUT (approx)

-- 1 Laptop Electronics 899.99 25
-- 2 Ultra Smartphone Electronics 899.99 40
-- 3 Coffee Maker Kitchen 79.99 30
-- 4 Pro Running Shoes Sportswear 149.99 35
-- 5 Mic Electronics 500 12
-- 6 Camera Electronics 5000 NULL
-- 7 Bluetooth Speaker Electronics 79.99 60
-- 8 Gaming Mouse Computer Accessories 49.99 100
-- 9 Portable Monitor Electronics 199.99 25


-- --------------------------------------------------
-- IMPORTANT NOTES
-- --------------------------------------------------

-- REPLACE INTO internally DELETE + INSERT karta hai

-- Agar record exist kare:
-- old row delete hoti hai
-- new row insert hoti hai

-- Agar record exist na kare:
-- normal INSERT hota hai

-- Isliye REPLACE INTO triggers aur auto increment behaviour
-- ko affect kar sakta hai


-- ---------------- END OF REPLACE NOTES ----------------