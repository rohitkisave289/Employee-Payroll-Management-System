USE employee_payroll_db;

-- 1. Display all employees
SELECT * FROM employees;


-- 2. Employees earning more than 50000
SELECT employee_name, job_title, salary
FROM employees
WHERE salary > 50000;


-- 3. Employees sorted by salary
SELECT employee_name, salary
FROM employees
ORDER BY salary DESC;


-- 4. Count employees
SELECT COUNT(*) AS total_employees
FROM employees;


-- 5. Average salary
SELECT AVG(salary) AS average_salary
FROM employees;


-- 6. Highest salary
SELECT MAX(salary) AS highest_salary
FROM employees;


-- 7. Employee and department details
SELECT
    e.employee_id,
    e.employee_name,
    e.job_title,
    d.department_name,
    e.salary
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;


-- 8. Number of employees in each department
SELECT
    d.department_name,
    COUNT(e.employee_id) AS employee_count
FROM departments d
JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;


-- 9. Average salary by department
SELECT
    d.department_name,
    AVG(e.salary) AS average_salary
FROM departments d
JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;


-- 10. Departments having average salary above 50000
SELECT
    d.department_name,
    AVG(e.salary) AS average_salary
FROM departments d
JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING AVG(e.salary) > 50000;


-- 11. Highest paid employee
SELECT *
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);


-- 12. Employees earning above average salary
SELECT employee_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);


-- 13. Second highest salary
SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);


-- 14. Salary category using CASE
SELECT
    employee_name,
    salary,
    CASE
        WHEN salary >= 70000 THEN 'High Salary'
        WHEN salary >= 50000 THEN 'Medium Salary'
        ELSE 'Low Salary'
    END AS salary_category
FROM employees;


-- 15. Complete payroll report
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
ON e.employee_id = p.employee_id
ORDER BY p.net_salary DESC;