-- --1. List the following details of each employee: 
-- --employee number, last name, first name, sex, and salary.

SELECT  employees.emp_no , employees.last_name , employees.first_name , employees.sex , salaries.salary FROM employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no;

-- --2. List first name, last name, and hire date for 
-- --employees who were hired in 1986.
SELECT first_name , last_name , hire_date FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <='1986-12-31';


-- -- 3.List the manager of each department with the following information: 
-- --department number, department name, the manager's employee number,
-- --last name, first name.

SELECT dept_manager.dept_no , departments.dept_name , dept_manager.emp_no , employees.last_name , employees.first_name FROM dept_manager
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no
Inner JOIN employees ON dept_manager.emp_no = employees.emp_no;


-- -- 4. List the department of each employee with the following information: 
-- -- employee number, last name, first name, and department name.
SELECT employees.emp_no , employees.last_name , employees.first_name , departments.dept_name FROM employees
INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no;


-- --  5. List first name, last name, and sex for employees whose 
-- -- first name is "Hercules" and last names begin with "B."
SELECT employees.first_name , employees.last_name , employees.sex FROM employees
WHERE first_name like 'Hercules' AND last_name like 'B%';

-- -- 6.List all employees in the Sales department, including 
-- --their employee number, last name, first name, and department name.
SELECT employees.emp_no , employees.last_name , employees.first_name, departments.dept_name From departments
INNER JOIN dept_emp ON dept_emp.dept_no = departments.dept_no
INNER JOIN employees ON employees.emp_no = dept_emp.emp_no
WHERE dept_name LIKE 'Sales';

-- 7.List all employees in the Sales and Development departments,
--including their employee number, last name, first name, and department name.

SELECT employees.emp_no , employees.last_name , employees.first_name, departments.dept_name From departments
INNER JOIN dept_emp ON dept_emp.dept_no = departments.dept_no
INNER JOIN employees ON employees.emp_no = dept_emp.emp_no
WHERE dept_name IN ('Sales', 'Development')
ORDER BY employees.emp_no asc;


-- --THIS checks that there are no employees that are in BOTH SALES and development
---First Create a view 
CREATE VIEW seven AS 
	SELECT dept_emp.emp_no , departments.dept_name FROM dept_emp
	INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
	WHERE emp_no IN (
		SELECT dept_emp.emp_no FROM dept_emp
		GROUP BY emp_no
		HAVING COUNT(emp_no) > 1)
AND dept_name LIKE 'Sales' OR dept_name LIKE 'Development'
----Use the view to check and see how many people have both departments 
SELECT seven.emp_no FROM seven
GROUP BY emp_no
HAVING COUNT(emp_no) > 1;
-----RESULT is NO one 


-- 8. In descending order, list the frequency count of 
-- employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS Count_of_Last_Name FROM employees
GROUP BY last_name
ORDER BY Count_of_Last_Name DESC;

