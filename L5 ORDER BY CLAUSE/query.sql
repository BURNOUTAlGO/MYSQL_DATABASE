/*
SQL Sorting and ORDER BY Tutorial
================================
This SQL script demonstrates various techniques for sorting data using ORDER BY.
Each SELECT query includes FULL OUTPUT for notes/GitHub.
*/

-- ===================================
-- Section 1: Database and Table Setup
-- ===================================

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

-- ==================================================
-- Section 2: Basic Sorting Operations
-- ==================================================

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
-- 4 | Gaming Mouse | Electronics | 59.99   | 200 | 2024-01-17 14:20:00
-- 3 | Coffee Maker | Appliances  | 79.99   | 100 | 2024-01-14 09:15:00
-- 5 | Bookshelf    | Furniture   | 149.99  | 25  | 2024-01-13 16:45:00
-- 2 | Desk Chair   | Furniture   | 199.99  | 30  | 2024-01-16 11:30:00
-- 1 | Laptop Pro   | Electronics | 1299.99 | 50  | 2024-01-15 10:00:00


SELECT * FROM products ORDER BY last_updated;

-- Output:
-- 5 | Bookshelf    | Furniture   | 149.99  | 25  | 2024-01-13 16:45:00
-- 3 | Coffee Maker | Appliances  | 79.99   | 100 | 2024-01-14 09:15:00
-- 1 | Laptop Pro   | Electronics | 1299.99 | 50  | 2024-01-15 10:00:00
-- 2 | Desk Chair   | Furniture   | 199.99  | 30  | 2024-01-16 11:30:00
-- 4 | Gaming Mouse | Electronics | 59.99   | 200 | 2024-01-17 14:20:00


-- ==================================================
-- Section 3: Advanced Sorting Techniques
-- ==================================================

SELECT * FROM products ORDER BY category DESC, price DESC;

-- Output:
-- 2 | Desk Chair   | Furniture   | 199.99  | 30  | 2024-01-16 11:30:00
-- 5 | Bookshelf    | Furniture   | 149.99  | 25  | 2024-01-13 16:45:00
-- 1 | Laptop Pro   | Electronics | 1299.99 | 50  | 2024-01-15 10:00:00
-- 4 | Gaming Mouse | Electronics | 59.99   | 200 | 2024-01-17 14:20:00
-- 3 | Coffee Maker | Appliances  | 79.99   | 100 | 2024-01-14 09:15:00


SELECT * FROM products ORDER BY 4;

-- Output:
-- 4 | Gaming Mouse | Electronics | 59.99   | 200 | 2024-01-17 14:20:00
-- 3 | Coffee Maker | Appliances  | 79.99   | 100 | 2024-01-14 09:15:00
-- 5 | Bookshelf    | Furniture   | 149.99  | 25  | 2024-01-13 16:45:00
-- 2 | Desk Chair   | Furniture   | 199.99  | 30  | 2024-01-16 11:30:00
-- 1 | Laptop Pro   | Electronics | 1299.99 | 50  | 2024-01-15 10:00:00


SELECT * FROM products
WHERE category = 'Electronics'
ORDER BY price;

-- Output:
-- 4 | Gaming Mouse | Electronics | 59.99   | 200 | 2024-01-17 14:20:00
-- 1 | Laptop Pro   | Electronics | 1299.99 | 50  | 2024-01-15 10:00:00


SELECT * FROM products ORDER BY BINARY category;

-- Output:
-- 3 | Coffee Maker | Appliances  | 79.99   | 100 | 2024-01-14 09:15:00
-- 1 | Laptop Pro   | Electronics | 1299.99 | 50  | 2024-01-15 10:00:00
-- 4 | Gaming Mouse | Electronics | 59.99   | 200 | 2024-01-17 14:20:00
-- 2 | Desk Chair   | Furniture   | 199.99  | 30  | 2024-01-16 11:30:00
-- 5 | Bookshelf    | Furniture   | 149.99  | 25  | 2024-01-13 16:45:00


-- ==================================================
-- Section 4: Function-Based Sorting
-- ==================================================

SELECT * FROM products ORDER BY LENGTH(product_name);

-- Output:
-- 2 | Desk Chair
-- 1 | Laptop Pro
-- 5 | Bookshelf
-- 4 | Gaming Mouse
-- 3 | Coffee Maker
-- (columns same as table; only order changed)


SELECT * FROM products ORDER BY DAY(last_updated);

-- Output:
-- 5 | Bookshelf
-- 3 | Coffee Maker
-- 1 | Laptop Pro
-- 2 | Desk Chair
-- 4 | Gaming Mouse


SELECT * FROM products
ORDER BY stock_quantity DESC
LIMIT 1;

-- Output:
-- 4 | Gaming Mouse | Electronics | 59.99 | 200 | 2024-01-17 14:20:00


-- ==================================================
-- Section 5: Custom Sorting Orders
-- ==================================================

SELECT * FROM products ORDER BY category;

-- Output:
-- Appliances → Electronics → Furniture (full rows)


SELECT * FROM products
ORDER BY FIELD(category,'Electronics','Appliances','Furniture'), price DESC;

-- Output:
-- 1 | Laptop Pro
-- 4 | Gaming Mouse
-- 3 | Coffee Maker
-- 2 | Desk Chair
-- 5 | Bookshelf


-- ==================================================
-- Section 6: Complex Sorting with Conditions
-- ==================================================

SELECT *,
    stock_quantity <= 50 AND price >= 200 AS priority_flag
FROM products
ORDER BY priority_flag DESC;

-- Output:
-- 1 | Laptop Pro | ... | priority_flag = 1
-- remaining rows priority_flag = 0


SELECT *,
    CASE
        WHEN stock_quantity <= 50 AND price >= 200 THEN 1
        WHEN stock_quantity <= 50 THEN 2
        ELSE 3
    END AS priority
FROM products
ORDER BY priority;

-- Output:
-- Laptop Pro (1)
-- Desk Chair, Bookshelf (2)
-- Coffee Maker, Gaming Mouse (3)


-- ==================================================
-- Section 7: NULL Handling
-- ==================================================

INSERT INTO products VALUES
(6, 'Desk Lamp', 'Furniture', NULL, 45, '2024-01-18 13:25:00'),
(7, 'Keyboard', 'Electronics', 89.99, NULL, '2024-01-19 15:10:00');


SELECT * FROM products ORDER BY price;

-- Output (MySQL):
-- Desk Lamp (NULL)
-- Gaming Mouse
-- Coffee Maker
-- Keyboard
-- Bookshelf
-- Desk Chair
-- Laptop Pro


SELECT *,
    price IS NULL
FROM products
ORDER BY price IS NULL;

-- Output:
-- Non-NULL prices first
-- NULL prices last


-- ==================================================
-- Section 8: Calculated Columns
-- ==================================================

SELECT *,
    price * stock_quantity AS total_value
FROM products
ORDER BY total_value DESC;

-- Output:
-- Laptop Pro   | total_value = 64999.50
-- Gaming Mouse | total_value = 11998.00
-- Coffee Maker| total_value = 7999.00
-- Desk Chair  | total_value = 5999.70
-- Bookshelf   | total_value = 3749.75


-- ==================================================
-- Section 9: Query Performance Analysis
-- ==================================================

EXPLAIN SELECT * FROM products ORDER BY category, price;
EXPLAIN SELECT * FROM products ORDER BY product_id;

