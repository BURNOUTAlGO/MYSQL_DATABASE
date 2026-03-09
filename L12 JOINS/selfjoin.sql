-- ====================================================================
-- SQL SELF JOIN COMPLETE NOTES (HINGLISH)
-- ====================================================================


-- --------------------------------------------------
-- 1. SELF JOIN KYA HOTA HAI
-- --------------------------------------------------

-- SELF JOIN tab use hota hai jab ek table ko usi table ke saath join karna hota hai.

-- Ye normally hierarchical data ke liye use hota hai
-- jaise:
-- Employee -> Manager relationship
-- Category -> Parent Category
-- Friend -> Friend relationship

-- Self join me same table ko do baar use kiya jata hai
-- aur unko alag naam (alias) diya jata hai.


-- --------------------------------------------------
-- 2. DATABASE CREATE KARNA
-- --------------------------------------------------

CREATE DATABASE self_join_tutorial;
USE self_join_tutorial;


-- --------------------------------------------------
-- 3. EMPLOYEES TABLE CREATE KARNA
-- --------------------------------------------------

-- manager_id column same table ke employee_id ko refer karta hai

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    job_title VARCHAR(100),
    salary DECIMAL(10, 2),
    department VARCHAR(50),
    manager_id INT,
    hire_date DATE
);


-- --------------------------------------------------
-- 4. SAMPLE EMPLOYEE DATA INSERT KARNA
-- --------------------------------------------------

-- Yaha ek hierarchy create ki gayi hai
-- CEO sabse upar hai jiska manager NULL hai

INSERT INTO employees VALUES
(1, 'James', 'Smith', 'CEO', 150000.00, 'Executive', NULL, '2010-01-15'),
(2, 'Sarah', 'Johnson', 'CTO', 140000.00, 'Technology', 1, '2011-03-10'),
(3, 'Michael', 'Williams', 'CFO', 140000.00, 'Finance', 1, '2012-07-22'),
(4, 'Jessica', 'Brown', 'HR Director', 110000.00, 'Human Resources', 1, '2013-05-18'),
(5, 'David', 'Miller', 'Senior Developer', 95000.00, 'Technology', 2, '2014-11-05'),
(6, 'Emily', 'Davis', 'Developer', 80000.00, 'Technology', 5, '2016-08-12'),
(7, 'Robert', 'Wilson', 'Junior Developer', 65000.00, 'Technology', 5, '2019-02-28'),
(8, 'Jennifer', 'Taylor', 'Accountant', 75000.00, 'Finance', 3, '2015-09-17'),
(9, 'Thomas', 'Anderson', 'Accountant', 72000.00, 'Finance', 3, '2017-06-24'),
(10, 'Lisa', 'Martinez', 'HR Specialist', 68000.00, 'Human Resources', 4, '2018-04-30');


-- --------------------------------------------------
-- 5. BASIC SELF JOIN (EMPLOYEE + MANAGER)
-- --------------------------------------------------

-- Yaha employees table ko khud se join kiya gaya hai
-- emp = employee
-- mgr = manager

SELECT *
FROM employees emp
JOIN employees mgr
ON emp.manager_id = mgr.employee_id;

-- Is query se pata chalega kaun employee kis manager ke under kaam karta hai.


-- --------------------------------------------------
-- 6. SELF JOIN WITH LEFT JOIN
-- --------------------------------------------------

-- LEFT JOIN use karne se sabhi employees dikhenge
-- including CEO jiska manager NULL hai

SELECT *
FROM employees emp
LEFT JOIN employees mgr
ON emp.manager_id = mgr.employee_id;


-- --------------------------------------------------
-- 7. EMPLOYEES PER DEPARTMENT
-- --------------------------------------------------

-- Ye self join nahi hai but department analysis ke liye useful hai

SELECT
department,
COUNT(*) AS employee_count,
GROUP_CONCAT(
CONCAT(first_name,' ',last_name)
ORDER BY employee_id
SEPARATOR ', '
) AS employees
FROM employees
GROUP BY department;


-- --------------------------------------------------
-- 8. SAME DEPARTMENT COLLEAGUES FIND KARNA
-- --------------------------------------------------

-- Self join use karke same department ke employees match kar rahe hain

SELECT *
FROM employees e1
JOIN employees e2
ON e1.department = e2.department
AND e1.employee_id < e2.employee_id;

-- Condition e1.employee_id < e2.employee_id
-- duplicates aur self matching ko avoid karti hai.


-- --------------------------------------------------
-- 9. EMPLOYEES JINKA SALARY MANAGER SE KAM HAI
-- --------------------------------------------------

SELECT *
FROM employees emp
JOIN employees mgr
ON emp.manager_id = mgr.employee_id
WHERE emp.salary < mgr.salary;


-- --------------------------------------------------
-- 10. SALARY DIFFERENCE ANALYSIS
-- --------------------------------------------------

-- Employees aur managers ke salary difference ka average

SELECT
emp.department,
COUNT(emp.employee_id) AS num_employees,
ROUND(AVG(mgr.salary),2) AS avg_manager_salary,
ROUND(AVG(emp.salary),2) AS avg_employee_salary,
ROUND(AVG(mgr.salary - emp.salary),2) AS avg_salary_difference
FROM employees emp
JOIN employees mgr
ON emp.manager_id = mgr.employee_id
GROUP BY emp.department
ORDER BY avg_salary_difference DESC;


-- --------------------------------------------------
-- IMPORTANT NOTES
-- --------------------------------------------------

-- 1. Self join me same table ko multiple times use kiya jata hai.
-- 2. Har table instance ko alag alias dena zaroori hai.
--    Example: emp, mgr
-- 3. Pair matching me conditions use karni chahiye
--    jaise e1.id < e2.id
-- 4. Self join large tables me heavy ho sakta hai
--    isliye join columns par indexing useful hoti hai.
-- 5. LEFT JOIN use karke unmatched records bhi include kar sakte hain.


-- ---------------- END OF SELF JOIN NOTES ----------------