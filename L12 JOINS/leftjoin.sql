-- SQL LEFT JOIN COMPLETE NOTES (HINGLISH)

-- --------------------------------------------------
-- 1. LEFT JOIN KYA HOTA HAI
-- --------------------------------------------------

-- LEFT JOIN (LEFT OUTER JOIN) ek SQL join hai jo
-- LEFT table ke saare records return karta hai
-- aur RIGHT table ke sirf matching records return karta hai.

-- Agar RIGHT table me match nahi milta
-- to RIGHT table ke columns me NULL values aati hain.

-- Example Concept:

-- Left Table        Right Table
--      A  +  A ∩ B  → LEFT JOIN

-- Matlab LEFT table ka pura data aayega.


-- --------------------------------------------------
-- 2. BASIC LEFT JOIN SYNTAX
-- --------------------------------------------------

-- SELECT columns
-- FROM table1
-- LEFT JOIN table2
-- ON table1.column = table2.column;


-- --------------------------------------------------
-- 3. DATABASE CREATE KARNA
-- --------------------------------------------------

CREATE DATABASE left_join_tutorial;
USE left_join_tutorial;


-- --------------------------------------------------
-- 4. CUSTOMERS TABLE CREATE KARNA
-- --------------------------------------------------

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    city VARCHAR(50)
);


-- --------------------------------------------------
-- 5. ORDERS TABLE CREATE KARNA
-- --------------------------------------------------

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


-- --------------------------------------------------
-- 6. CUSTOMERS TABLE ME DATA INSERT
-- --------------------------------------------------

INSERT INTO customers (customer_id, customer_name, email, city)
VALUES 
(1, 'John Smith', 'john@example.com', 'New York'),
(2, 'Jane Doe', 'jane@example.com', 'Los Angeles'),
(3, 'Robert Johnson', 'robert@example.com', 'Chicago'),
(4, 'Emily Davis', 'emily@example.com', 'Houston'),
(5, 'Michael Brown', 'michael@example.com', 'Phoenix');

-- OUTPUT:
-- customer_id | customer_name | city
-- 1 | John Smith | New York
-- 2 | Jane Doe | Los Angeles
-- 3 | Robert Johnson | Chicago
-- 4 | Emily Davis | Houston
-- 5 | Michael Brown | Phoenix


-- --------------------------------------------------
-- 7. ORDERS TABLE ME DATA INSERT
-- --------------------------------------------------

INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES 
(101, 1, '2023-01-15', 150.75),
(102, 3, '2023-01-16', 89.50),
(103, 1, '2023-01-20', 45.25),
(104, 2, '2023-01-25', 210.30),
(105, 3, '2023-02-01', 75.00);

-- OUTPUT:
-- order_id | customer_id | total_amount
-- 101 | 1 | 150.75
-- 102 | 3 | 89.50
-- 103 | 1 | 45.25
-- 104 | 2 | 210.30
-- 105 | 3 | 75.00


-- --------------------------------------------------
-- 8. BASIC LEFT JOIN EXAMPLE
-- --------------------------------------------------

-- Sabhi customers aur unke orders (agar hain)

SELECT 
c.customer_id,
c.customer_name,
o.order_id,
o.order_date,
o.total_amount
FROM customers c
LEFT JOIN orders o 
ON c.customer_id = o.customer_id;

-- OUTPUT EXAMPLE:
-- customer_id | customer_name | order_id
-- 1 | John Smith | 101
-- 1 | John Smith | 103
-- 2 | Jane Doe | 104
-- 3 | Robert Johnson | 102
-- 3 | Robert Johnson | 105
-- 4 | Emily Davis | NULL
-- 5 | Michael Brown | NULL


-- --------------------------------------------------
-- 9. CUSTOMERS JINHONE ORDER NAHI KIYA
-- --------------------------------------------------

-- LEFT JOIN + NULL check

SELECT 
c.customer_id,
c.customer_name
FROM customers c
LEFT JOIN orders o 
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- OUTPUT:
-- Emily Davis
-- Michael Brown


-- --------------------------------------------------
-- 10. AGGREGATE FUNCTION WITH LEFT JOIN
-- --------------------------------------------------

-- Customer ka order count aur total spending

SELECT 
c.customer_id,
c.customer_name,
COUNT(o.order_id) AS order_count,
IFNULL(SUM(o.total_amount),0) AS total_spent
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

-- OUTPUT EXAMPLE
-- John Smith | 2 | 196.00
-- Jane Doe | 1 | 210.30
-- Robert Johnson | 2 | 164.50
-- Emily Davis | 0 | 0
-- Michael Brown | 0 | 0


-- --------------------------------------------------
-- 11. SHIPPING TABLE CREATE KARNA
-- --------------------------------------------------

CREATE TABLE shipping (
shipping_id INT PRIMARY KEY,
order_id INT,
shipping_date DATE,
carrier VARCHAR(50),
tracking_number VARCHAR(50),
FOREIGN KEY (order_id) REFERENCES orders(order_id)
);


-- --------------------------------------------------
-- 12. SHIPPING DATA INSERT
-- --------------------------------------------------

INSERT INTO shipping VALUES
(1001,101,'2023-01-16','FedEx','FDX123456789'),
(1002,104,'2023-01-26','UPS','UPS987654321'),
(1003,105,'2023-02-02','USPS','USPS456789123');


-- --------------------------------------------------
-- 13. MULTIPLE LEFT JOIN EXAMPLE
-- --------------------------------------------------

SELECT 
c.customer_name,
o.order_id,
o.order_date,
o.total_amount,
s.carrier,
s.tracking_number
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
LEFT JOIN shipping s
ON o.order_id = s.order_id;


-- --------------------------------------------------
-- 14. WHERE vs ON CLAUSE FILTERING
-- --------------------------------------------------

-- METHOD 1: WHERE CLAUSE

SELECT 
c.customer_id,
c.customer_name,
c.city,
o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE c.city = 'New York';


-- METHOD 2: ON CLAUSE

SELECT 
c.customer_id,
c.customer_name,
c.city,
o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id 
AND c.city = 'New York';


-- METHOD 3: SUBQUERY

SELECT 
c.customer_id,
c.customer_name,
c.city,
o.order_id
FROM 
(SELECT * FROM customers WHERE city='New York') c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;


-- --------------------------------------------------
-- 15. ADVANCED FILTERING WITH HAVING
-- --------------------------------------------------

-- Customers jinhone last 30 days me order nahi kiya

SELECT 
c.customer_id,
c.customer_name,
MAX(o.order_date) AS last_order_date
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING 
MAX(o.order_date) IS NULL
OR MAX(o.order_date) < DATE_SUB(CURDATE(), INTERVAL 30 DAY);


-- --------------------------------------------------
-- IMPORTANT NOTE
-- --------------------------------------------------

-- LEFT JOIN me LEFT table ke saare rows aate hain.
-- RIGHT table ke sirf matching rows aate hain.
-- Agar match nahi milta to RIGHT table ke columns NULL hote hain.

-- ---------------- END OF LEFT JOIN NOTES ----------------