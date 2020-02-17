-- List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT emp.emp_no, last_name, first_name, gender, salary
FROM employees AS emp
JOIN salaries AS sal
ON emp.emp_no = sal.emp_no;

-- List employees who were hired in 1986.
SELECT emp_no, last_name, first_name, hire_date 
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT dep.dept_no, dept_name, emp.emp_no, last_name, first_name, from_date, to_date
FROM departments AS dep
JOIN dept_manager AS man
ON dep.dept_no = man.dept_no
JOIN employees AS emp
ON man.emp_no = emp.emp_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT emp.emp_no, last_name, first_name, dept_name
FROM employees AS emp
JOIN dept_emp AS de
ON emp.emp_no = de.emp_no
JOIN departments AS dep
ON de.dept_no = dep.dept_no;

-- List all employees whose first name is "Hercules" and last names begin with "B."
SELECT last_name, first_name
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT emp.emp_no, last_name, first_name, dept_name
FROM employees AS emp
JOIN dept_emp AS de
ON emp.emp_no = de.emp_no
JOIN departments AS dep
ON de.dept_no = dep.dept_no
WHERE dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp.emp_no, last_name, first_name, dept_name
FROM employees AS emp
JOIN dept_emp AS de
ON emp.emp_no = de.emp_no
JOIN departments AS dep
ON de.dept_no = dep.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(*) AS "count"
FROM employees
GROUP BY last_name
ORDER BY "count" DESC;