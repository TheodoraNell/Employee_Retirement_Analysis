

-- Joining employees and titles tables
SELECT em.emp_no,em.first_name,em.last_name,ti.title,ti.from_date,ti.to_date
INTO retirement_titles
FROM employees as em
INNER JOIN titles as ti
ON em.emp_no=ti.emp_no 
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY em.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
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


-- Joining employees, department employees, and titles tables
SELECT DISTINCT ON (em.emp_no) em.emp_no, em.first_name, em.last_name, em.birth_date, de.from_date, de.to_date, ti.title
INTO mentorship_eligibilty
FROM employees as em
INNER JOIN dept_emp as de
ON em.emp_no=de.emp_no
INNER JOIN titles as ti
ON em.emp_no=ti.emp_no
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND de.to_date = '9999-01-01'
ORDER BY em.emp_no;

