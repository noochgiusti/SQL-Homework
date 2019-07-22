-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/4pr0ad
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE  --  Determine the relations  (

);

CREATE TABLE  Departments  (
     dept_no  VARCHAR   NOT NULL,
     dept_name  VARCHAR   NOT NULL,
    CONSTRAINT  pk_Departments  PRIMARY KEY (
         dept_no 
     )
);

CREATE TABLE  Employee_Departments  (
     emp_no  INTEGER   NOT NULL,
     dept_no  VARCHAR   NOT NULL,
     from_date  INT   NOT NULL,
     to_data  INT   NOT NULL
);

CREATE TABLE  Manager_Departments  (
     dept_no  VARCHAR   NOT NULL,
     emp_no  VARCHAR   NOT NULL,
     from_date  INT   NOT NULL,
     to_date  INT   NOT NULL
);

CREATE TABLE  Employees  (
     emp_no  INTEGER   NOT NULL,
     birth_date  INT   NOT NULL,
     first_name  VARCHAR   NOT NULL,
     last_name  VARCHAR   NOT NULL,
     gender  VARCHAR   NOT NULL,
     hire_date  INT   NOT NULL,
    CONSTRAINT  pk_Employees  PRIMARY KEY (
         emp_no , hire_date 
     )
);

CREATE TABLE  Salaries  (
     emp_no  INTEGER   NOT NULL,
     salary  INTEGER   NOT NULL,
     from_date  INT   NOT NULL,
     to_date  INT   NOT NULL
);

CREATE TABLE  Titles  (
     emp_no  INTEGER   NOT NULL,
     title  VARCHAR   NOT NULL,
     from_date  INT   NOT NULL,
     to_date  INT   NOT NULL
);

ALTER TABLE  Employee_Departments  ADD CONSTRAINT  fk_Employee_Departments_emp_no_from_date  FOREIGN KEY( emp_no ,  from_date )
REFERENCES  Employees  ( emp_no ,  hire_date );

ALTER TABLE  Employee_Departments  ADD CONSTRAINT  fk_Employee_Departments_dept_no  FOREIGN KEY( dept_no )
REFERENCES  Departments  ( dept_no );

ALTER TABLE  Manager_Departments  ADD CONSTRAINT  fk_Manager_Departments_dept_no  FOREIGN KEY( dept_no )
REFERENCES  Departments  ( dept_no );

ALTER TABLE  Manager_Departments  ADD CONSTRAINT  fk_Manager_Departments_emp_no_from_date  FOREIGN KEY( emp_no ,  from_date )
REFERENCES  Employees  ( emp_no ,  hire_date );

ALTER TABLE  Salaries  ADD CONSTRAINT  fk_Salaries_emp_no_from_date  FOREIGN KEY( emp_no ,  from_date )
REFERENCES  Employees  ( emp_no ,  hire_date );

ALTER TABLE  Titles  ADD CONSTRAINT  fk_Titles_emp_no_from_date  FOREIGN KEY( emp_no ,  from_date )
REFERENCES  Employees  ( emp_no ,  hire_date );

