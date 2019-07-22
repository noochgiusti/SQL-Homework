CREATE TABLE  Departments  (
     dept_no  VARCHAR,
     dept_name  VARCHAR   NOT NULL,
    CONSTRAINT  pk_Departments  PRIMARY KEY (
         dept_no 
     )
);

CREATE TABLE  Employee_Departments  (
     emp_no  VARCHAR   NOT NULL,
     dept_no  VARCHAR   NOT NULL,
     from_date VARCHAR  NOT NULL,
     to_data  VARCHAR   NOT NULL
);


CREATE TABLE  Manager_Departments  (
     dept_no  VARCHAR   NOT NULL,
     emp_no  VARCHAR   NOT NULL,
     from_date  VARCHAR   NOT NULL,
     to_date  VARCHAR  NOT NULL
);


CREATE TABLE  Employees  (
     emp_no  VARCHAR   NOT NULL,
     birth_date  VARCHAR   NOT NULL,
     first_name  VARCHAR   NOT NULL,
     last_name  VARCHAR   NOT NULL,
     gender  VARCHAR   NOT NULL,
     hire_date  VARCHAR   NOT NULL,
    CONSTRAINT  pk_Employees  PRIMARY KEY (
         emp_no , hire_date 
     )
);


CREATE TABLE  Salaries  (
     emp_no  INTEGER   NOT NULL,
     salary  INTEGER   NOT NULL,
     from_date  VARCHAR   NOT NULL,
     to_date  VARCHAR  NOT NULL
);


CREATE TABLE  Titles  (
     emp_no  INTEGER   NOT NULL,
     title  VARCHAR   NOT NULL,
     from_date  VARCHAR   NOT NULL,
     to_date VARCHAR  NOT NULL
);


ALTER TABLE  Employee_Departments  ADD CONSTRAINT  fk_Employee_Departments_dept_no  FOREIGN KEY( dept_no )
REFERENCES  Departments  ( dept_no );

ALTER TABLE  Manager_Departments  ADD CONSTRAINT  fk_Manager_Departments_dept_no  FOREIGN KEY( dept_no )
REFERENCES  Departments  ( dept_no );

ALTER TABLE  Manager_Departments  ADD CONSTRAINT  fk_Manager_Departments_emp_no_from_date  FOREIGN KEY( emp_no ,  from_date )
REFERENCES  Employees  ( emp_no ,  hire_date );

--1
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Employees.gender, Salaries.salary
FROM Employees
LEFT JOIN Salaries
ON Salaries.emp_no = Employees.emp_no

--2
SELECT * FROM employees
WHERE hire_date LIKE '1986%';

--3
SELECT Departments.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name, Manager_Departments.from_date, manager_departments.to_date
FROM departments
INNER JOIN manager_departments
ON manager_departments.dept_no = departments.dept_no
JOIN employees 
ON employees.emp_no = manager_departments.emp_no;

--4
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN employee_departments
ON employee_departments.emp_no = employees.emp_no
JOIN departments
ON departments.dept_no = employee_departments.dept_no

--5
SELECT * FROM employees
WHERE first_name LIKE 'Hercules'
AND last_name LIKE 'B%';

--6
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN employee_departments
ON employee_departments.emp_no = employees.emp_no
JOIN departments
ON departments.dept_no = employee_departments.dept_no
Where departments.dept_name = 'Sales'

--7
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN employee_departments
ON employee_departments.emp_no = employees.emp_no
JOIN departments
ON departments.dept_no = employee_departments.dept_no
Where departments.dept_name = 'Sales'
OR departments.dept_name = 'Development'

--8
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;

