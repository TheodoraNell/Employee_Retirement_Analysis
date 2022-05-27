SELECT emp_no, first_name, last_name
FROM employees

SELECT emp_no, title, from_date, to_date
FROM titles

SELECT * FROM employees;

SELECT * FROM titles; 

SELECT * FROM retirement_titles; 

-- Joining employees and titles tables
SELECT em.emp_no,em.first_name,em.last_name,ti.title,ti.from_date,ti.to_date
INTO retirement_titles
FROM employees as em
INNER JOIN titles as ti
ON em.emp_no=ti.emp_no 
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY em.emp_no;

-- Creating table without duplicate  names
SELECT DISTINCT ON (rt.emp_no) rt.emp_no, rt.first_name, rt.last_name, rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE to_date ='9999-01-01'
ORDER BY rt.emp_no ASC, to_date DESC;

SELECT COUNT(DISTINCT title)
FROM unique_titles;

-- Retiring employee count by title
SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY COUNT DESC;

SELECT * FROM retiring_titles



-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_name) _____,
______,
______,
______

INTO nameyourtable
FROM _______
WHERE _______
ORDER BY _____, _____ DESC;
