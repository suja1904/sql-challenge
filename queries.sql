--1.List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no as employee_number,e.last_name,e.first_name,e.sex,s.salary
FROM employees as e
LEFT JOIN salaries as s
ON e.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date BETWEEN '1986-1-1' and '1986-12-31'
ORDER BY hire_date ASC;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name 
FROM dept_manager as dm
LEFT JOIN employees as e
ON dm.emp_no = e.emp_no
LEFT JOIN departments as d
ON dm.dept_no = d.dept_no
ORDER BY d.dept_name ASC;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name , d.dept_name
FROM employees as e
LEFT JOIN dept_emp as de 
ON e.emp_no = de.emp_no
LEFT JOIN departments as d
ON de.dept_no = d.dept_no
ORDER BY d.dept_name ASC;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT e.last_name, e.first_name , e.sex
FROM employees as e
WHERE first_name = 'Hercules' AND last_name like 'B%'

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name
FROM employees as e
LEFT JOIN dept_emp as de 
ON e.emp_no = de.emp_no
LEFT JOIN departments as d
ON de.dept_no = d.dept_no
WHERE d.dept_name like '%Sales%'
ORDER BY d.dept_name ASC;

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
LEFT JOIN dept_emp as de 
ON e.emp_no = de.emp_no
LEFT JOIN departments as d
ON de.dept_no = d.dept_no
WHERE d.dept_name in ('Sales','Development')
ORDER BY d.dept_name ASC;

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
--wgho
SELECT last_name,count(distinct emp_no) AS FREQUENCY
FROM employees 
GROUP BY last_name
ORDER BY 2 DESC;

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");




