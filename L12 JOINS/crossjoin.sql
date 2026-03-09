-- ====================================================================
-- SQL CROSS JOIN COMPLETE NOTES (HINGLISH)
-- ====================================================================


-- --------------------------------------------------
-- 1. CROSS JOIN KYA HOTA HAI
-- --------------------------------------------------

-- CROSS JOIN ko Cartesian Product bhi kehte hain.

-- Ye join type first table ki har row ko
-- second table ki har row ke saath combine karta hai.

-- Matlab:
-- agar table A me 4 rows hain
-- aur table B me 5 rows hain

-- result = 4 * 5 = 20 rows

-- Isliye CROSS JOIN me combinations generate hote hain.


-- --------------------------------------------------
-- 2. DATABASE CREATE KARNA
-- --------------------------------------------------

CREATE DATABASE cross_join_tutorial;
USE cross_join_tutorial;


-- --------------------------------------------------
-- 3. PRODUCTS TABLE CREATE KARNA
-- --------------------------------------------------

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL
);


-- --------------------------------------------------
-- 4. COLORS TABLE CREATE KARNA
-- --------------------------------------------------

CREATE TABLE colors (
    color_id INT PRIMARY KEY,
    color_name VARCHAR(30) NOT NULL
);


-- --------------------------------------------------
-- 5. PRODUCTS DATA INSERT KARNA
-- --------------------------------------------------

INSERT INTO products (product_id, product_name) VALUES
(1, 'T-shirt'),
(2, 'Jeans'),
(3, 'Sweater'),
(4, 'Jacket');


-- --------------------------------------------------
-- 6. COLORS DATA INSERT KARNA
-- --------------------------------------------------

INSERT INTO colors (color_id, color_name) VALUES
(1, 'Red'),
(2, 'Blue'),
(3, 'Green'),
(4, 'Black'),
(5, 'White');


-- --------------------------------------------------
-- 7. BASIC CROSS JOIN EXAMPLE
-- --------------------------------------------------

-- Har product ke saath har color combine hoga

SELECT 
p.product_name,
c.color_name
FROM products p
CROSS JOIN colors c;

-- Agar products = 4 aur colors = 5
-- to total result rows = 4 * 5 = 20


-- --------------------------------------------------
-- 8. SIZES TABLE CREATE KARNA
-- --------------------------------------------------

CREATE TABLE sizes (
    size_id INT PRIMARY KEY,
    size_name VARCHAR(10) NOT NULL
);


-- --------------------------------------------------
-- 9. SIZES DATA INSERT KARNA
-- --------------------------------------------------

INSERT INTO sizes (size_id, size_name) VALUES
(1, 'S'),
(2, 'M'),
(3, 'L'),
(4, 'XL');


-- --------------------------------------------------
-- 10. PRODUCT VARIATIONS GENERATE KARNA
-- --------------------------------------------------

-- Yaha hum product + color + size combinations bana rahe hain

-- Agar:
-- products = 4
-- colors = 5
-- sizes = 4

-- Total combinations = 4 * 5 * 4 = 80


EXPLAIN
SELECT 
p.product_name,
c.color_name,
s.size_name,
CONCAT(
p.product_name,
' - ',
c.color_name,
' - Size ',
s.size_name
) AS full_product_description
FROM products p
CROSS JOIN colors c
CROSS JOIN sizes s
WHERE p.product_name='T-shirt';


-- --------------------------------------------------
-- EXAMPLE OUTPUT
-- --------------------------------------------------

-- T-shirt - Red - Size S
-- T-shirt - Red - Size M
-- T-shirt - Red - Size L
-- T-shirt - Red - Size XL
-- T-shirt - Blue - Size S
-- T-shirt - Blue - Size M
-- ...
-- T-shirt - White - Size XL


-- --------------------------------------------------
-- PRACTICAL USE CASES OF CROSS JOIN
-- --------------------------------------------------

-- 1. Product variations generate karna (E-commerce)
-- 2. Test data generate karna
-- 3. Combinations create karna
-- 4. Scheduling systems


-- --------------------------------------------------
-- IMPORTANT NOTE
-- --------------------------------------------------

-- CROSS JOIN me normally ON condition nahi hoti
-- kyunki har row har row ke saath combine hoti hai.

-- Agar tables bade ho to result bahut bada ho sakta hai
-- isliye CROSS JOIN carefully use karna chahiye.


-- ---------------- END OF CROSS JOIN NOTES ----------------