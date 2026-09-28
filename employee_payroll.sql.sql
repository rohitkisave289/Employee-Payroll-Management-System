
-- EMPLOYEE & PAYROLL MANAGEMENT SYSTEM




CREATE DATABASE employee_payroll_db;

USE employee_payroll_db;




CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL UNIQUE
);



CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    hire_date DATE,
    department_id INT,
    job_title VARCHAR(50),
    salary DECIMAL(10,2),
    
    FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
);



CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY,
    employee_id INT,
    attendance_date DATE,
    status VARCHAR(20),
    
    FOREIGN KEY (employee_id)
    REFERENCES employees(employee_id)
);



-- 5. CREATE LEAVES TABLE


CREATE TABLE leaves (
    leave_id INT PRIMARY KEY,
    employee_id INT,
    leave_date DATE,
    leave_type VARCHAR(30),
    reason VARCHAR(150),
    
    FOREIGN KEY (employee_id)
    REFERENCES employees(employee_id)
);


-- =========================================================
-- 6. CREATE PAYROLL TABLE
-- =========================================================

CREATE TABLE payroll (
    payroll_id INT PRIMARY KEY,
    employee_id INT,
    payroll_month VARCHAR(20),
    basic_salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    deductions DECIMAL(10,2),
    net_salary DECIMAL(10,2),
    
    FOREIGN KEY (employee_id)
    REFERENCES employees(employee_id)
);


-- =========================================================
-- 7. INSERT DEPARTMENTS
-- =========================================================

INSERT INTO departments
(department_id, department_name)
VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Sales');


-- =========================================================
-- 8. INSERT EMPLOYEES
-- =========================================================

INSERT INTO employees
(employee_id, employee_name, email, phone, hire_date,
 department_id, job_title, salary)
VALUES
(101, 'Amit Sharma', 'amit@company.com', '9876543210',
 '2023-06-15', 1, 'Software Engineer', 55000),

(102, 'Priya Patil', 'priya@company.com', '9876543211',
 '2022-08-20', 2, 'HR Executive', 42000),

(103, 'Rahul Verma', 'rahul@company.com', '9876543212',
 '2021-03-10', 1, 'Senior Developer', 75000),

(104, 'Sneha Joshi', 'sneha@company.com', '9876543213',
 '2024-01-12', 3, 'Accountant', 48000),

(105, 'Vikas More', 'vikas@company.com', '9876543214',
 '2023-11-05', 4, 'Marketing Executive', 40000),

(106, 'Neha Kulkarni', 'neha@company.com', '9876543215',
 '2022-05-18', 1, 'Software Developer', 62000),

(107, 'Sagar Pawar', 'sagar@company.com', '9876543216',
 '2020-09-25', 5, 'Sales Executive', 45000),

(108, 'Pooja Deshmukh', 'pooja@company.com', '9876543217',
 '2024-02-14', 2, 'HR Manager', 68000),

(109, 'Karan Jadhav', 'karan@company.com', '9876543218',
 '2021-12-01', 5, 'Sales Manager', 72000),

(110, 'Riya Shah', 'riya@company.com', '9876543219',
 '2023-07-22', 3, 'Financial Analyst', 65000);


-- =========================================================
-- 9. INSERT ATTENDANCE
-- =========================================================

INSERT INTO attendance
(attendance_id, employee_id, attendance_date, status)
VALUES
(1, 101, '2026-09-01', 'Present'),
(2, 102, '2026-09-01', 'Present'),
(3, 103, '2026-09-01', 'Present'),
(4, 104, '2026-09-01', 'Absent'),
(5, 105, '2026-09-01', 'Present'),
(6, 106, '2026-09-01', 'Present'),
(7, 107, '2026-09-01', 'Present'),
(8, 108, '2026-09-01', 'Present'),
(9, 109, '2026-09-01', 'Absent'),
(10, 110, '2026-09-01', 'Present');


-- =========================================================
-- 10. INSERT LEAVES
-- =========================================================

INSERT INTO leaves
(leave_id, employee_id, leave_date, leave_type, reason)
VALUES
(1, 104, '2026-09-05', 'Sick Leave', 'Fever'),
(2, 109, '2026-09-07', 'Casual Leave', 'Personal Work'),
(3, 102, '2026-09-10', 'Casual Leave', 'Family Function'),
(4, 105, '2026-09-12', 'Sick Leave', 'Cold'),
(5, 101, '2026-09-15', 'Casual Leave', 'Personal Work');


-- =========================================================
-- 11. INSERT PAYROLL
-- =========================================================

INSERT INTO payroll
(payroll_id, employee_id, payroll_month,
 basic_salary, bonus, deductions, net_salary)
VALUES
(1, 101, 'September 2026', 55000, 5000, 2000, 58000),
(2, 102, 'September 2026', 42000, 3000, 1500, 43500),
(3, 103, 'September 2026', 75000, 7000, 2500, 79500),
(4, 104, 'September 2026', 48000, 2000, 1000, 49000),
(5, 105, 'September 2026', 40000, 2500, 1200, 41300),
(6, 106, 'September 2026', 62000, 5000, 2000, 65000),
(7, 107, 'September 2026', 45000, 3000, 1500, 46500),
(8, 108, 'September 2026', 68000, 6000, 2500, 71500),
(9, 109, 'September 2026', 72000, 5000, 2500, 74500),
(10, 110, 'September 2026', 65000, 4000, 2000, 67000);


-- =========================================================
-- 12. BASIC SELECT QUERIES
-- =========================================================

-- All employees
SELECT * FROM employees;

-- All departments
SELECT * FROM departments;

-- Employee name and salary
SELECT employee_name, salary
FROM employees;

-- Salary greater than 50000
SELECT employee_name, salary
FROM employees
WHERE salary > 50000;

-- Salary between 40000 and 60000
SELECT employee_name, salary
FROM employees
WHERE salary BETWEEN 40000 AND 60000;

-- Employees sorted by salary
SELECT employee_name, salary
FROM employees
ORDER BY salary DESC;


-- =========================================================
-- 13. LIKE OPERATOR
-- =========================================================

SELECT *
FROM employees
WHERE employee_name LIKE 'A%';

SELECT *
FROM employees
WHERE employee_name LIKE '%a%';


-- =========================================================
-- 14. AGGREGATE FUNCTIONS
-- =========================================================

-- Total employees
SELECT COUNT(*) AS total_employees
FROM employees;

-- Average salary
SELECT AVG(salary) AS average_salary
FROM employees;

-- Maximum salary
SELECT MAX(salary) AS highest_salary
FROM employees;

-- Minimum salary
SELECT MIN(salary) AS lowest_salary
FROM employees;

-- Total salary
SELECT SUM(salary) AS total_salary
FROM employees;


-- =========================================================
-- 15. GROUP BY
-- =========================================================

SELECT department_id,
       COUNT(*) AS employee_count
FROM employees
GROUP BY department_id;


-- Average salary by department
SELECT department_id,
       AVG(salary) AS average_salary
FROM employees
GROUP BY department_id;


-- Maximum salary by department
SELECT department_id,
       MAX(salary) AS highest_salary
FROM employees
GROUP BY department_id;


-- =========================================================
-- 16. HAVING
-- =========================================================

SELECT department_id,
       AVG(salary) AS average_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 50000;


-- =========================================================
-- 17. INNER JOIN
-- =========================================================

SELECT
    e.employee_id,
    e.employee_name,
    e.job_title,
    d.department_name,
    e.salary
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;


-- =========================================================
-- 18. JOIN + WHERE
-- =========================================================

SELECT
    e.employee_name,
    d.department_name,
    e.salary
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_name = 'IT';


-- =========================================================
-- 19. JOIN + GROUP BY
-- =========================================================

SELECT
    d.department_name,
    COUNT(e.employee_id) AS total_employees,
    AVG(e.salary) AS average_salary
FROM departments d
JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;


-- =========================================================
-- 20. HIGHEST PAID EMPLOYEE
-- =========================================================

SELECT *
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);


-- =========================================================
-- 21. EMPLOYEES EARNING ABOVE AVERAGE
-- =========================================================

SELECT employee_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);


-- =========================================================
-- 22. SECOND HIGHEST SALARY
-- =========================================================

SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);


-- =========================================================
-- 23. CASE STATEMENT
-- =========================================================

SELECT
    employee_name,
    salary,
    CASE
        WHEN salary >= 70000 THEN 'High Salary'
        WHEN salary >= 50000 THEN 'Medium Salary'
        ELSE 'Low Salary'
    END AS salary_category
FROM employees;


-- =========================================================
-- 24. ATTENDANCE REPORT
-- =========================================================

SELECT
    e.employee_name,
    a.attendance_date,
    a.status
FROM employees e
JOIN attendance a
ON e.employee_id = a.employee_id;


-- =========================================================
-- 25. LEAVE REPORT
-- =========================================================

SELECT
    e.employee_name,
    l.leave_date,
    l.leave_type,
    l.reason
FROM employees e
JOIN leaves l
ON e.employee_id = l.employee_id;


-- =========================================================
-- 26. PAYROLL REPORT
-- =========================================================

SELECT
    e.employee_name,
    d.department_name,
    p.payroll_month,
    p.basic_salary,
    p.bonus,
    p.deductions,
    p.net_salary
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN payroll p
ON e.employee_id = p.employee_id;


-- =========================================================
-- 27. HIGHEST NET SALARY
-- =========================================================

SELECT
    e.employee_name,
    p.net_salary
FROM employees e
JOIN payroll p
ON e.employee_id = p.employee_id
ORDER BY p.net_salary DESC;


-- =========================================================
-- 28. VIEW
-- =========================================================

CREATE VIEW employee_details AS
SELECT
    e.employee_id,
    e.employee_name,
    e.job_title,
    d.department_name,
    e.salary
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;


-- View data
SELECT * FROM employee_details;


-- =========================================================
-- 29. STORED PROCEDURE
-- =========================================================

DELIMITER //

CREATE PROCEDURE GetEmployeesByDepartment(
    IN dept_id INT
)
BEGIN
    SELECT
        employee_id,
        employee_name,
        job_title,
        salary
    FROM employees
    WHERE department_id = dept_id;
END //

DELIMITER ;


-- Execute procedure
CALL GetEmployeesByDepartment(1);


-- =========================================================
-- 30. UPDATE
-- =========================================================

UPDATE employees
SET salary = salary + 5000
WHERE employee_id = 101;


-- Check updated employee
SELECT *
FROM employees
WHERE employee_id = 101;


-- =========================================================
-- 31. TRANSACTION
-- =========================================================

START TRANSACTION;

UPDATE employees
SET salary = salary + 2000
WHERE department_id = 1;

-- Check changes
SELECT *
FROM employees
WHERE department_id = 1;

-- Save changes
COMMIT;


-- =========================================================
-- 32. INDEX
-- =========================================================

CREATE INDEX idx_employee_department
ON employees(department_id);


-- =========================================================
-- 33. FINAL PROJECT REPORT
-- =========================================================

SELECT
    e.employee_id,
    e.employee_name,
    d.department_name,
    e.job_title,
    e.salary,
    p.net_salary
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN payroll p
ON e.employee_id = p.employee_id
ORDER BY p.net_salary DESC;