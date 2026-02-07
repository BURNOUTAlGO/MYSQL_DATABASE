-- =============================================
-- MySQL LIMIT Clause – COMPLETE GITHUB NOTES
-- =============================================
-- Rule:
-- SELECT *  => Output mein saare columns aayenge
-- LIMIT     => Sirf number of rows restrict karega

-- =============================================
-- 1. Setup and Sample Data
-- =============================================

CREATE DATABASE db13;
USE db13;

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    category VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO products (name, price, category) VALUES
('Laptop', 999.99, 'Electronics'),
('Smartphone', 499.99, 'Electronics'),
('Coffee Maker', 79.99, 'Appliances'),
('Headphones', 149.99, 'Electronics'),
('Blender', 59.99, 'Appliances'),
('Tablet', 299.99, 'Electronics'),
('Microwave', 199.99, 'Appliances'),
('Smart Watch', 249.99, 'Electronics'),
('Toaster', 39.99, 'Appliances'),
('Speaker', 89.99, 'Electronics');

-- Reference Table Order (by id):
-- id | name          | price  | category     | created_at
-- 1  | Laptop        | 999.99 | Electronics  | auto
-- 2  | Smartphone    | 499.99 | Electronics  | auto
-- 3  | Coffee Maker  | 79.99  | Appliances   | auto
-- 4  | Headphones    | 149.99 | Electronics  | auto
-- 5  | Blender       | 59.99  | Appliances   | auto
-- 6  | Tablet        | 299.99 | Electronics  | auto
-- 7  | Microwave     | 199.99 | Appliances   | auto
-- 8  | Smart Watch   | 249.99 | Electronics  | auto
-- 9  | Toaster       | 39.99  | Appliances   | auto
-- 10 | Speaker       | 89.99  | Electronics  | auto


-- =============================================
-- 2. Basic LIMIT Usage
-- =============================================

-- Return first 2 products
SELECT * FROM products ORDER BY id LIMIT 2;

-- Output:
-- id | name       | price  | category     | created_at
-- 1  | Laptop     | 999.99 | Electronics  | auto
-- 2  | Smartphone | 499.99 | Electronics  | auto


-- =============================================
-- 3. LIMIT with OFFSET
-- =============================================

-- Syntax 1: LIMIT row_count OFFSET offset
SELECT * FROM products ORDER BY id LIMIT 2 OFFSET 2;

-- Output:
-- id | name         | price | category    | created_at
-- 3  | Coffee Maker | 79.99 | Appliances  | auto
-- 4  | Headphones   | 149.99| Electronics | auto


-- Syntax 2: LIMIT offset, row_count
SELECT * FROM products ORDER BY id LIMIT 2, 2;

-- Output:
-- id | name         | price | category    | created_at
-- 3  | Coffee Maker | 79.99 | Appliances  | auto
-- 4  | Headphones   | 149.99| Electronics | auto


-- =============================================
-- 4. Pagination Implementation
-- =============================================

-- Page size: 3 items per page

-- Page 1
SELECT * FROM products LIMIT 3 OFFSET 0;

-- Output:
-- id | name       | price  | category     | created_at
-- 1  | Laptop     | 999.99 | Electronics  | auto
-- 2  | Smartphone | 499.99 | Electronics  | auto
-- 3  | Coffee Maker | 79.99 | Appliances | auto


-- Page 2
SELECT * FROM products LIMIT 3 OFFSET 3;

-- Output:
-- id | name        | price | category     | created_at
-- 4  | Headphones  | 149.99| Electronics  | auto
-- 5  | Blender     | 59.99 | Appliances   | auto
-- 6  | Tablet      | 299.99| Electronics  | auto


-- Page 3
SELECT * FROM products LIMIT 3 OFFSET 6;

-- Output:
-- id | name        | price | category     | created_at
-- 7  | Microwave   | 199.99| Appliances   | auto
-- 8  | Smart Watch | 249.99| Electronics  | auto
-- 9  | Toaster     | 39.99 | Appliances   | auto


-- Alternative syntax (LIMIT offset, count)

SELECT * FROM products LIMIT 0, 3;

-- Output:
-- 1 | Laptop
-- 2 | Smartphone
-- 3 | Coffee Maker


SELECT * FROM products LIMIT 3, 3;

-- Output:
-- 4 | Headphones
-- 5 | Blender
-- 6 | Tablet


SELECT * FROM products LIMIT 6, 3;

-- Output:
-- 7 | Microwave
-- 8 | Smart Watch
-- 9 | Toaster


-- =============================================
-- 5. Common Use Cases
-- =============================================

-- Top 3 most expensive products
SELECT * FROM products
ORDER BY price DESC
LIMIT 3;

-- Output:
-- id | name        | price  | category     | created_at
-- 1  | Laptop      | 999.99 | Electronics  | auto
-- 2  | Smartphone  | 499.99 | Electronics  | auto
-- 6  | Tablet      | 299.99 | Electronics  | auto


-- Get 5 random products
SELECT * FROM products
ORDER BY RAND()
LIMIT 5;

-- Output:
-- Any 5 random rows from products table
-- (Order and rows may vary each execution)


-- =============================================
-- 6. Performance Considerations
-- =============================================

SELECT *
FROM products
ORDER BY created_at
LIMIT 1000000, 10;

-- Output:
-- Empty result set (table has only 10 rows)


SELECT *
FROM products
WHERE created_at > '2025-01-01 00:00:00'
ORDER BY created_at
LIMIT 10;

-- Output:
-- Empty result set (no records match condition)


-- =============================================
-- Key Takeaways
-- =============================================
-- LIMIT restricts number of rows
-- OFFSET skips rows
-- ORDER BY + LIMIT is mandatory for meaningful results
-- High OFFSET can hurt performance
