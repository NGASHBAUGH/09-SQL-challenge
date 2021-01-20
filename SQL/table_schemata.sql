

CREATE TABLE departments(
	dept_no VARCHAR(4) PRIMARY KEY  NOT NULL,
	dept_name VARCHAR(25)  NOT NULL
);

CREATE TABLE titles(
	title_id VARCHAR(5) PRIMARY KEY  NOT NULL,
	title VARCHAR(25)  NOT NULL
);

CREATE TABLE employees(
	emp_no INTEGER PRIMARY KEY NOT NULL,
	emp_title VARCHAR(5) NOT NULL,
	FOREIGN KEY (emp_title) REFERENCES titles(title_id),
	birth_date DATE NOT NULL,
	first_name VARCHAR(25) NOT NULL,
	last_name VARCHAR(25) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL
);

CREATE TABLE salaries(
	emp_no INTEGER  NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INTEGER  NOT NULL
);

