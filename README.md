# SQL-CHALLENGE
# Create an image file of your ERD.

```sql
Departments as d
-  
dept_no pk varchar(5) 
dept_name varchar(30)
	
Dept_emp 
-	
emp_no varchar(10) FK >- e.emp_no
dept_no varchar(5) FK >- d.dept_no


titles 
-
title_id varchar(5) pk
title varchar(30)

Employees as e
-
emp_no pk varchar(10) FK >- dept_manager.emp_no
emp_title_id varchar(5) FK >- titles.title_id
birth_date date
first_name varchar(45)
last_name varchar(45)
sex varchar(1)
hire_date date

dept_manager 
-
dept_no varchar(5) FK >- Departments.dept_no
emp_no varchar(10)

salaries
-
emp_no varchar(10) FK >- e.emp_no
salary int
```

# Create a .sql file of your table schemata:

```sql
-- create titles table
CREATE TABLE titles (
	title_id varchar(5) PRIMARY KEY,
	title varchar(30)
);

-- create employees table
CREATE TABLE employees (
	emp_no varchar(10) PRIMARY KEY,
	emp_title_id varchar(5) references titles(title_id),
	birth_date date,
	first_name varchar(45),
	last_name varchar(45),
	sex varchar(1),
	hire_date date
);

-- create departments table
CREATE TABLE departments (
	dept_no varchar(5) PRIMARY KEY,
	dept_name varchar(30)
);

-- create department managers table
CREATE TABLE dept_manager (
	dept_no varchar(5) references departments(dept_no),
	emp_no varchar(10)
);

-- create department employees table
CREATE TABLE dept_emp (
	emp_no varchar(10) references employees(emp_no),
	dept_no varchar(5) references departments(dept_no)
);

-- create salaries table
CREATE TABLE salaries (
	emp_no varchar(10) references employees(emp_no),
	salary int
);

alter table Table1
add constraint name_of_constraint_on_Table_1_column
foreign key (column) references Table3 (other_column);

ALTER TABLE employees ALTER COLUMN emp_no SET NOT NULL;
ALTER TABLE titles ALTER COLUMN title_id SET NOT NULL;
ALTER TABLE departments ALTER COLUMN dept_no SET NOT NULL;


select column_name, data_type , discription from SCHEMAS

ALTER TABLE departments ALTER COLUMN dept_no SET NOT NULL;
```

# Create a .sql file of your queries:

```sql
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
```



