
-- !- Logical operators 
--* AND , OR , IN ,!=
-- !- NULL handling
--* IS NULL , NOT NULL
-- !- Pattern matching
--* BETWEEN , LIKE 
-- !- Subqueries



CREATE DATABASE bookstore;
USE bookstore;

-- ================================
-- Table Creation
-- ================================
CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(50),
    price DECIMAL(10,2),
    publication_date DATE,
    category VARCHAR(30),
    in_stock INT
);

-- ================================
-- Insert Records
-- ================================
INSERT INTO books VALUES
(1,'The Mysql Guide','John Smith',29.99,'2023-01-15','Technology',50),
(2,'Data Science','Abhinav Maurya',29.99,'2023-09-23','Science',50),
(3,'Mystery at Midnights','Akash Sahu',29.99,'2021-03-24','Fiction',50),
(4,'Cooking Essentials','Raju Gupta',29.99,'2020-10-23','Cooking',50),
(5,'Cook',NULL,60.99,'2020-10-23','Cooking',70);

-- ================================
-- Fetch All Records
-- ================================
SELECT * FROM books;

/*
OUTPUT:
+---------+-----------------------+------------------+-------+------------------+------------+----------+
| book_id | title                 | author           | price | publication_date | category   | in_stock |
+---------+-----------------------+------------------+-------+------------------+------------+----------+
| 1 | The Mysql Guide        | John Smith      | 29.99 | 2023-01-15 | Technology | 50 |
| 2 | Data Science           | Abhinav Maurya  | 29.99 | 2023-09-23 | Science    | 50 |
| 3 | Mystery at Midnights   | Akash Sahu      | 29.99 | 2021-03-24 | Fiction    | 50 |
| 4 | Cooking Essentials    | Raju Gupta      | 29.99 | 2020-10-23 | Cooking    | 50 |
| 5 | Cook                  | NULL            | 60.99 | 2020-10-23 | Cooking    | 70 |
*/

-- ================================
-- WHERE Clause
-- ================================
SELECT * FROM books WHERE category = 'Technology';

/*
OUTPUT:
| 1 | The Mysql Guide | John Smith | 29.99 | Technology |
*/

-- ================================
-- Logical Operators
-- ================================
-- AND
SELECT * FROM books 
WHERE category = 'Technology' AND price < 30;

/*
OUTPUT:
| 1 | The Mysql Guide | 29.99 | Technology |
*/

-- OR
SELECT * FROM books 
WHERE category = 'Technology' OR price < 30;

/*
OUTPUT:
| 1 | The Mysql Guide |
| 2 | Data Science |
| 3 | Mystery at Midnights |
| 4 | Cooking Essentials |
*/

-- NOT EQUAL
SELECT * FROM books WHERE category != 'Technology';

/*
OUTPUT:
| 2 | Data Science |
| 3 | Mystery at Midnights |
| 4 | Cooking Essentials |
| 5 | Cook |
*/

-- ================================
-- NULL Handling
-- ================================
SELECT * FROM books WHERE author IS NULL;

/*
OUTPUT:
| 5 | Cook | NULL |
*/

SELECT * FROM books WHERE author IS NOT NULL;

/*
OUTPUT:
| All records except book_id = 5 |
*/

-- ================================
-- BETWEEN
-- ================================
SELECT * FROM books WHERE price BETWEEN 20 AND 30;

/*
OUTPUT:
| 1 | The Mysql Guide |
| 2 | Data Science |
| 3 | Mystery at Midnights |
| 4 | Cooking Essentials |
*/

-- ================================
-- LIKE (Pattern Matching)
-- ================================
SELECT * FROM books WHERE title LIKE '%sql%';

/*
OUTPUT:
| 1 | The Mysql Guide |
*/

SELECT * FROM books WHERE title LIKE 'the%';

/*
OUTPUT:
| 1 | The Mysql Guide |
*/

SELECT * FROM books WHERE author LIKE '_a%';

/*
OUTPUT:
| 3 | Akash Sahu |
| 4 | Raju Gupta |
*/

-- ================================
-- Case Sensitive LIKE
-- ================================
SELECT * FROM books WHERE title LIKE BINARY '%SqL%';

/*
OUTPUT:
No rows found
*/

-- ================================
-- Subqueries
-- ================================
SELECT * FROM books 
WHERE category IN ('technology','cooking','fiction');

/*
OUTPUT:
| 1 | Technology |
| 3 | Fiction |
| 4 | Cooking |
| 5 | Cooking |
*/

SELECT * FROM books 
WHERE price > (SELECT AVG(price) FROM books);

/*
AVG(price) ≈ 36.39

OUTPUT:
| 5 | Cook | 60.99 |
*/
