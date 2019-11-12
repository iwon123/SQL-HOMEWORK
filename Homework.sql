-- Create table for each csv file
CREATE TABLE departments(
	dept_no INT,
	dept_name VARCHAR
	);

SELECT * FROM departments;
DROP TABLE departments;

CREATE TABLE dept_emp(
	emp_no INT,
	dept_no INT,
	from_date VARCHAR,
	to_date VARCHAR
	);

CREATE TABLE dept_manager(
	dept_no INT,
	emp_no INT,
	from_date DATE, 
	to_date INT
);

SELECT * FROM dept_manager
DROP TABlE dept_manager

CREATE TABLE employees(
	emp_no INT,
	birth_date VARCHAR,
	first_name VARCHAR,
	last_name VARCHAR,
	gender VARCHAR, 
	hire_date VARCHAR
);
SELECT emp_no,to_char(hire_date, 'YYYY') AS format_date FROM employees
WHERE employees.format_date = '1986';
ALTER TABLE employees 
ADD format_date date;
SELECT * FROM employees;

DROP TABLE employees;

CREATE TABLE salaries(
	emp_no INT,
	salary INT,
	from_date VARCHAR,
	to_date VARCHAR
);

CREATE TABLE titles(
	emp_no INT,
	title VARCHAR,
	from_date VARCHAR,
	to_date VARCHAR
);

SELECT * FROM employees;
SELECT * FROM dept_manager;
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM salaries;
SELECT * FROM titles;

-- Question 1--
--List the following details of each employee:
--employee number, last name, first name, gender, and salary--
--Check to see if the tables have data. 
SELECT * FROM employees;
SELECT * FROM salaries;
--Join the two tables (employees and salaries)
SELECT salaries.salary, employees.first_name, employees.last_name, employees.gender
FROM employees
INNER JOIN salaries ON salaries.emp_no = employees.emp_no;

--Question 2--
--Employees who were hired in 1986
SELECT * FROM employees
WHERE employees.hire_date = 1986;

--Question 3-- 
SELECT employees.name, departments.dept_no, departments.dept_name,
dept_manager.emp_no, employees.first_name, employees.last_name, employees.emp_no, departments.dept_name
FROM employees 
INNER JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
INNER JOIN departments ON departments.dept_no = dept_manager.dept_no
INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no;

--Question 4-- 
SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees
JOIN dept_emp ON (employees.emp_no = dept_emp.emp_no)
JOIN departments ON (departments.dept_no = dept_emp.dept_no)

-Question 5--
SELECT emp_no, last_name, first_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE ('B%');

--Question 6--
SELECT E.emp_no, E.last_name, E.first_name, D.dept_name
FROM employees
JOIN dept_emp ON (dept_emp.emp_no = employees.emp_no)
JOIN departments ON (departments.dept_no = dept_emp.dept_no)
WHERE departments.dept_name = 'Sales';

--Question 7--
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON (dept_emp.emp_no = employees.emp_no)
JOIN departments ON (departments.dept_no = dept_emp.dept_no)
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'

--Question 8--
SELECT last_name, COUNT(last_name) AS "Employees_with_Last_name"
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC

