/*
SQL Sorting and ORDER BY Tutorial
================================
This SQL script demonstrates various techniques for sorting data using ORDER BY.
All SELECT * queries include FULL TABLE OUTPUT for notes/GitHub.
*/

-- Section 1: Database and Table Setup
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

-- =====================================================
-- Section 2: Basic Sorting Operations
-- =====================================================

SELECT * FROM products;

-- Output:
-- product_id | product_name  | category     | price   | stock_quantity | last_updated
-- 1 | Laptop Pro   | Electronics | 1299.99 | 50  | 2024-01-15 10:00:00
-- 2 | Desk Chair   | Furniture   | 199.99  | 30  | 2024-01-16 11:30:00
-- 3 | Coffee Maker | Appliances  | 79.99   | 100 | 2024-01-14 09:15:00
-- 4 | Gaming Mouse | Electronics | 59.99   | 200 | 2024-01-17 14:20:00
-- 5 | Bookshelf    | Furniture   | 149.99  | 25  | 2024-01-13 16:45:00


SELECT * FROM products ORDER BY price ASC;

-- Output:
-- product_id | product_name  | category     | price   | stock_quantity | last_updated
-- 4 | Gaming Mouse | Electronics | 59.99   | 200 | 2024-01-17 14:20:00
-- 3 | Coffee Maker | Appliances  | 79.99   | 100 | 2024-01-14 09:15:00
-- 5 | Bookshelf    | Furniture   | 149.99  | 25  | 2024-01-13 16:45:00
-- 2 | Desk Chair   | Furniture   | 199.99  | 30  | 2024-01-16 11:30:00
-- 1 | Laptop Pro   | Electronics | 1299.99 | 50  | 2024-01-15 10:00:00


SELECT * FROM products ORDER BY last_updated;

-- Output:
-- product_id | product_name  | category     | price   | stock_quantity | last_updated
-- 5 | Bookshelf    | Furniture   | 149.99  | 25  | 2024-01-13 16:45:00
-- 3 | Coffee Maker | Appliances  | 79.99   | 100 | 2024-01-14 09:15:00
-- 1 | Laptop Pro   | Electronics | 1299.99 | 50  | 2024-01-15 10:00:00
-- 2 | Desk Chair   | Furniture   | 199.99  | 30  | 2024-01-16 11:30:00
-- 4 | Gaming Mouse | Electronics | 59.99   | 200 | 2024-01-17 14:20:00


-- =====================================================
-- Section 3: Advanced Sorting Techniques
-- =====================================================

SELECT * FROM products ORDER BY category DESC, price DESC;

-- Output:
-- product_id | product_name  | category     | price   | stock_quantity | last_updated
-- 2 | Desk Chair   | Furniture   | 199.99  | 30  | 2024-01-16 11:30:00
-- 5 | Bookshelf    | Furniture   | 149.99  | 25  | 2024-01-13 16:45:00
-- 1 | Laptop Pro   | Electronics | 1299.99 | 50  | 2024-01-15 10:00:00
-- 4 | Gaming Mouse | Electronics | 59.99   | 200 | 2024-01-17 14:20:00
-- 3 | Coffee Maker | Appliances  | 79.99   | 100 | 2024-01-14 09:15:00


SELECT * FROM products ORDER BY 4;

-- Output:
-- product_id | product_name  | category     | price   | stock_quantity | last_updated
-- 4 | Gaming Mouse | Electronics | 59.99   | 200 | 2024-01-17 14:20:00
-- 3 | Coffee Maker | Appliances  | 79.99   | 100 | 2024-01-14 09:15:00
-- 5 | Bookshelf    | Furniture   | 149.99  | 25  | 2024-01-13 16:45:00
-- 2 | Desk Chair   | Furniture   | 199.99  | 30  | 2024-01-16 11:30:00
-- 1 | Laptop Pro   | Electronics | 1299.99 | 50  | 2024-01-15 10:00:00


SELECT * FROM products 
WHERE category = 'Electronics' 
ORDER BY price;

-- Output:
-- product_id | product_name  | category     | price   | stock_quantity | last_updated
-- 4 | Gaming Mouse | Electronics | 59.99   | 200 | 2024-01-17 14:20:00
-- 1 | Laptop Pro   | Electronics | 1299.99 | 50  | 2024-01-15 10:00:00


SELECT * FROM products ORDER BY BINARY category;

-- Output:
-- product_id | product_name  | category     | price   | stock_quantity | last_updated
-- 3 | Coffee Maker | Appliances  | 79.99   | 100 | 2024-01-14 09:15:00
-- 1 | Laptop Pro   | Electronics | 1299.99 | 50  | 2024-01-15 10:00:00
-- 4 | Gaming Mouse | Electronics | 59.99   | 200 | 2024-01-17 14:20:00
-- 2 | Desk Chair   | Furniture   | 199.99  | 30  | 2024-01-16 11:30:00
-- 5 | Bookshelf    | Furniture   | 149.99  | 25  | 2024-01-13 16:45:00


-- =====================================================
-- Section 4: Function-Based Sorting
-- =====================================================

SELECT * FROM products ORDER BY LENGTH(product_name);

-- Output:
-- product_id | product_name  | category     | price   | stock_quantity | last_updated
-- 2 | Desk Chair   | Furniture   | 199.99  | 30  | 2024-01-16 11:30:00
-- 1 | Laptop Pro   | Electronics | 1299.99 | 50  | 2024-01-15 10:00:00
-- 5 | Bookshelf    | Furniture   | 149.99  | 25  | 2024-01-13 16:45:00
-- 4 | Gaming Mouse | Electronics | 59.99   | 200 | 2024-01-17 14:20:00
-- 3 | Coffee Maker | Appliances  | 79.99   | 100 | 2024-01-14 09:15:00


SELECT * FROM products ORDER BY DAY(last_updated);

-- Output:
-- product_id | product_name  | category     | price   | stock_quantity | last_updated
-- 5 | Bookshelf    | Furniture   | 149.99  | 25  | 2024-01-13 16:45:00
-- 3 | Coffee Maker | Appliances  | 79.99   | 100 | 2024-01-14 09:15:00
-- 1 | Laptop Pro   | Electronics | 1299.99 | 50  | 2024-01-15 10:00:00
-- 2 | Desk Chair   | Furniture   | 199.99  | 30  | 2024-01-16 11:30:00
-- 4 | Gaming Mouse | Electronics | 59.99   | 200 | 2024-01-17 14:20:00


SELECT * FROM products 
ORDER BY stock_quantity DESC 
LIMIT 1;

-- Output:
-- product_id | product_name  | category     | price | stock_quantity | last_updated
-- 4 | Gaming Mouse | Electronics | 59.99 | 200 | 2024-01-17 14:20:00


-- =====================================================
-- Section 7: NULL Handling
-- =====================================================

INSERT INTO products VALUES
(6, 'Desk Lamp', 'Furniture', NULL, 45, '2024-01-18 13:25:00'),
(7, 'Keyboard', 'Electronics', 89.99, NULL, '2024-01-19 15:10:00');


SELECT * FROM products ORDER BY price;

-- Output (MySQL NULLs first):
-- 6 | Desk Lamp    | Furniture   | NULL   | 45  | 2024-01-18 13:25:00
-- 4 | Gaming Mouse | Electronics | 59.99  | 200 | 2024-01-17 14:20:00
-- 3 | Coffee Maker | Appliances  | 79.99  | 100 | 2024-01-14 09:15:00
-- 7 | Keyboard     | Electronics | 89.99  | NULL| 2024-01-19 15:10:00
-- 5 | Bookshelf    | Furniture   | 149.99 | 25  | 2024-01-13 16:45:00
-- 2 | Desk Chair   | Furniture   | 199.99 | 30  | 2024-01-16 11:30:00
-- 1 | Laptop Pro   | Electronics | 1299.99| 50  | 2024-01-15 10:00:00
