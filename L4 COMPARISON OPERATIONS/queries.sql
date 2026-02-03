-- Active: 1770055191543@@127.0.0.1@3306
-- StoreDB Complete SQL Script
-- This script creates a sample database with products and orders tables
-- and demonstrates various SQL query examples WITH OUTPUT

-- Create the database
CREATE DATABASE StoreDB;
USE StoreDB;

-- Create products table
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

-- Insert sample data into products table
INSERT INTO products (product_name, category, price, stock) VALUES
('Laptop', 'Electronics', 1200.00, 10),
('Phone', 'Electronics', 800.00, 15),
('Tablet', 'Electronics', 600.00, 20),
('Headphones', 'Accessories', 150.00, 50),
('Mouse', 'Accessories', 30.00, 100),
('Keyboard', 'Accessories', 45.00, 80);

-- Create orders table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    customer_name VARCHAR(50)
);

-- Insert sample data into orders table
INSERT INTO orders (order_date, customer_name) VALUES
('2024-02-01', 'Alice'),
('2024-02-05', 'Bob'),
('2024-02-10', 'Charlie'),
('2024-02-15', 'David');

-- ========================================
-- QUERY EXAMPLES WITH OUTPUT
-- ========================================

-- Get all products with a price of exactly 600
SELECT * FROM products WHERE price = 600;

-- Output:
-- product_id | product_name | category     | price  | stock
-- 3          | Tablet       | Electronics  | 600.00 | 20


-- Get all products that are NOT priced at 800
SELECT * FROM products WHERE price <> 800;

-- Output:
-- product_id | product_name | category     | price   | stock
-- 1          | Laptop       | Electronics  | 1200.00 | 10
-- 3          | Tablet       | Electronics  | 600.00  | 20
-- 4          | Headphones   | Accessories  | 150.00  | 50
-- 5          | Mouse        | Accessories  | 30.00   | 100
-- 6          | Keyboard     | Accessories  | 45.00   | 80


SELECT * FROM products WHERE price != 800;

-- Output:
-- product_id | product_name | category     | price   | stock
-- 1          | Laptop       | Electronics  | 1200.00 | 10
-- 3          | Tablet       | Electronics  | 600.00  | 20
-- 4          | Headphones   | Accessories  | 150.00  | 50
-- 5          | Mouse        | Accessories  | 30.00   | 100
-- 6          | Keyboard     | Accessories  | 45.00   | 80


-- Get all products priced below 500
SELECT * FROM products WHERE price < 500;

-- Output:
-- product_id | product_name | category     | price  | stock
-- 4          | Headphones   | Accessories  | 150.00 | 50
-- 5          | Mouse        | Accessories  | 30.00  | 100
-- 6          | Keyboard     | Accessories  | 45.00  | 80


-- Get all products priced above 700
SELECT * FROM products WHERE price > 700;

-- Output:
-- product_id | product_name | category     | price   | stock
-- 1          | Laptop       | Electronics  | 1200.00 | 10
-- 2          | Phone        | Electronics  | 800.00  | 15


-- Get all products priced at or below 150
SELECT * FROM products WHERE price <= 150;

-- Output:
-- product_id | product_name | category     | price  | stock
-- 4          | Headphones   | Accessories  | 150.00 | 50
-- 5          | Mouse        | Accessories  | 30.00  | 100
-- 6          | Keyboard     | Accessories  | 45.00  | 80


-- Get all products priced at or above 800
SELECT * FROM products WHERE price >= 800;

-- Output:
-- product_id | product_name | category     | price   | stock
-- 1          | Laptop       | Electronics  | 1200.00 | 10
-- 2          | Phone        | Electronics  | 800.00  | 15


-- Get all products where the category is exactly "Electronics"
SELECT * FROM products WHERE category = 'Electronics';

-- Output:
-- product_id | product_name | category     | price   | stock
-- 1          | Laptop       | Electronics  | 1200.00 | 10
-- 2          | Phone        | Electronics  | 800.00  | 15
-- 3          | Tablet       | Electronics  | 600.00  | 20


-- Retrieve Orders Placed Before February 10, 2024
SELECT * FROM orders WHERE order_date < '2024-02-10';

-- Output:
-- order_id | order_date  | customer_name
-- 1        | 2024-02-01  | Alice
-- 2        | 2024-02-05  | Bob


-- String comparison example (alphabetical ordering)
SELECT * FROM products WHERE product_name > 'Mouse';

-- Output:
-- product_id | product_name | category     | price   | stock
-- 2          | Phone        | Electronics  | 800.00  | 15
-- 3          | Tablet       | Electronics  | 600.00  | 20


-- Numeric comparison with strings (lexicographic comparison)
SELECT '100' < '2';

-- Output:
-- 1
-- Explanation:
-- String comparison hota hai
-- '1' comes before '2'


-- Another string comparison example
SELECT 100 < '211fcfc';

-- Output:
-- 1
-- Explanation:
-- SQL string ko number mein convert karta hai
-- '211fcfc' → 211
-- 100 < 211 → TRUE
