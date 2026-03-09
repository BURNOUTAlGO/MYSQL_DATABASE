-- SQL INNER JOIN COMPLETE NOTES (HINGLISH)

-- --------------------------------------------------
-- 1. INNER JOIN KYA HOTA HAI
-- --------------------------------------------------

-- INNER JOIN SQL ka ek join type hai jo 2 ya usse zyada tables ka data combine karta hai.

-- Ye sirf wahi rows return karta hai jisme dono tables me matching value hoti hai.

-- Agar kisi table me matching record nahi hai to wo result me include nahi hota.

-- Example Concept:

-- Table1        Table2
--    A ∩ B  → INNER JOIN
-- Sirf common data return hota hai.


-- --------------------------------------------------
-- 2. DATABASE CREATE KARNA
-- --------------------------------------------------

CREATE DATABASE db_inner_join;
USE db_inner_join;


-- --------------------------------------------------
-- 3. AUTHORS TABLE CREATE KARNA
-- --------------------------------------------------

CREATE TABLE authors (
    author_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birth_year INT
);


-- --------------------------------------------------
-- 4. BOOKS TABLE CREATE KARNA
-- --------------------------------------------------

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author_id INT,
    publication_year INT,
    price DECIMAL(6,2)
);


-- --------------------------------------------------
-- 5. AUTHORS TABLE ME DATA INSERT KARNA
-- --------------------------------------------------

INSERT INTO authors (author_id, first_name, last_name, birth_year)
VALUES 
(1,'Jane','Austen',1775),
(2,'George','Orwell',1903),
(3,'Ernest','Hemingway',1899),
(4,'Agatha','Christie',1890),
(5,'J.K.','Rowling',1965);

-- OUTPUT:
-- author_id | first_name | last_name | birth_year
-- 1         | Jane       | Austen    | 1775
-- 2         | George     | Orwell    | 1903
-- 3         | Ernest     | Hemingway | 1899
-- 4         | Agatha     | Christie  | 1890
-- 5         | J.K.       | Rowling   | 1965


-- --------------------------------------------------
-- 6. BOOKS TABLE ME DATA INSERT KARNA
-- --------------------------------------------------

INSERT INTO books (book_id, title, author_id, publication_year, price)
VALUES
(101,'Pride and Prejudice',1,1813,12.99),
(102,'1984',2,1949,14.50),
(103,'Animal Farm',2,1945,11.75),
(104,'The Old Man and the Sea',3,1952,10.99),
(105,'Murder on the Orient Express',4,1934,13.25),
(106,'Death on the Nile',4,1937,12.50),
(107,'Emma',1,1815,11.99),
(108,'For Whom the Bell Tolls',3,1940,15.75);

-- OUTPUT:
-- book_id | title                          | author_id | publication_year | price
-- 101     | Pride and Prejudice             | 1         | 1813             | 12.99
-- 102     | 1984                            | 2         | 1949             | 14.50
-- 103     | Animal Farm                     | 2         | 1945             | 11.75
-- 104     | The Old Man and the Sea         | 3         | 1952             | 10.99
-- 105     | Murder on the Orient Express    | 4         | 1934             | 13.25
-- 106     | Death on the Nile               | 4         | 1937             | 12.50
-- 107     | Emma                            | 1         | 1815             | 11.99
-- 108     | For Whom the Bell Tolls         | 3         | 1940             | 15.75


-- --------------------------------------------------
-- 7. BASIC INNER JOIN QUERY
-- --------------------------------------------------

SELECT b.title, a.first_name, a.last_name, a.birth_year
FROM books AS b
INNER JOIN authors AS a
ON a.author_id = b.author_id
WHERE b.publication_year > 1940
ORDER BY birth_year;

-- OUTPUT:
-- title                     | first_name | last_name | birth_year
-- Animal Farm               | George     | Orwell    | 1903
-- 1984                      | George     | Orwell    | 1903
-- The Old Man and the Sea   | Ernest     | Hemingway | 1899


-- --------------------------------------------------
-- 8. COUNT BOOKS PER AUTHOR
-- --------------------------------------------------

SELECT a.first_name, a.last_name, COUNT(*) AS book_count
FROM authors AS a
JOIN books AS b
ON a.author_id = b.author_id
GROUP BY a.author_id;

-- OUTPUT:
-- first_name | last_name | book_count
-- Jane       | Austen    | 2
-- George     | Orwell    | 2
-- Ernest     | Hemingway | 2
-- Agatha     | Christie  | 2


-- --------------------------------------------------
-- 9. MANY TO MANY RELATIONSHIP TABLE
-- --------------------------------------------------

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

INSERT INTO categories VALUES
(1,'Fiction'),
(2,'Classic'),
(3,'Romance'),
(4,'Political'),
(5,'Mystery'),
(6,'Adventure');


-- --------------------------------------------------
-- 10. BOOK CATEGORY JUNCTION TABLE
-- --------------------------------------------------

CREATE TABLE book_categories (
book_id INT,
category_id INT,
PRIMARY KEY (book_id,category_id)
);

INSERT INTO book_categories VALUES
(101,1),(101,2),(101,3),
(102,1),(102,2),(102,4),
(103,1),(103,2),(103,4),
(104,1),(104,2),(104,6),
(105,1),(105,5),
(106,1),(106,5),
(107,1),(107,2),(107,3),
(108,1),(108,2),(108,6);


-- --------------------------------------------------
-- 11. BOOK + AUTHOR + CATEGORY JOIN
-- --------------------------------------------------

SELECT b.title,
a.first_name,
a.last_name,
GROUP_CONCAT(c.category_name SEPARATOR ', ') AS categories
FROM books b
JOIN authors a ON b.author_id = a.author_id
JOIN book_categories bc ON b.book_id = bc.book_id
JOIN categories c ON bc.category_id = c.category_id
GROUP BY b.book_id;

-- OUTPUT EXAMPLE:
-- Pride and Prejudice | Jane Austen | Fiction, Classic, Romance
-- 1984                | George Orwell | Fiction, Classic, Political


-- --------------------------------------------------
-- 12. JOIN CONDITION IN ON CLAUSE
-- --------------------------------------------------

SELECT b.title, a.last_name
FROM books b
INNER JOIN authors a
ON b.author_id = a.author_id
AND b.publication_year < 1950
AND a.birth_year < 1900;


-- --------------------------------------------------
-- 13. SAME QUERY USING WHERE
-- --------------------------------------------------

SELECT b.title, a.last_name
FROM books b
INNER JOIN authors a
ON b.author_id = a.author_id
WHERE b.publication_year < 1950
AND a.birth_year < 1900;


-- --------------------------------------------------
-- 14. OLD BOOKS QUERY
-- --------------------------------------------------

SELECT b.title, a.last_name
FROM books b
INNER JOIN authors a
ON b.author_id = a.author_id
WHERE YEAR(CURDATE()) - b.publication_year > 70;


-- --------------------------------------------------
-- 15. AUTHORS WITH MORE THAN ONE BOOK
-- --------------------------------------------------

SELECT a.first_name,
a.last_name,
COUNT(b.book_id) AS book_count
FROM authors a
INNER JOIN books b
ON a.author_id = b.author_id
GROUP BY a.author_id
HAVING COUNT(b.book_id) > 1;

-- OUTPUT:
-- Jane       | Austen    | 2
-- George     | Orwell    | 2
-- Ernest     | Hemingway | 2
-- Agatha     | Christie  | 2


-- --------------------------------------------------
-- IMPORTANT NOTE
-- --------------------------------------------------

-- INNER JOIN NULL values ko include nahi karta.
-- Agar kisi table me matching value nahi hai to wo row result me nahi aati.
-- Agar unmatched rows bhi chahiye ho to LEFT JOIN ya RIGHT JOIN use karte hain.

-- ------------------ END ------------------