   -- Display all the rows and columns from table employees 
   -- SELECT Command --Data retrieval commands 
select * from employees;--terminator sql command ended 
  -- No indentation required
 -- not a case sensitive language 

-- 1.Display all the rows and columns from table departments
select * from departments;

--2. Selecting specific columns
--Display first_name,salary from employees TABLE
select first_name,salary from employees;

-- Display first_name,phone_number,hire_date,email for all employees

-- Comparision operators  -->, < ,>= ,<= ,!=
-- Display all employees having salary greater than 10,000
select * from employees where salary >=10000;

-- Exercises 
--1. Display all the details from departments table with department_id=10
select * from departments where department_id=10;

--2.Display all the details of employees having job_id=5
select * from employees where job_id=5;
--3.Write a query to display salary of employee_id=102
select salary  from employees where employee_id=102;

--Using Select command with different datatypes
--Integer 
-- Display all the employees of department_id=3
select * from employees where department_id=3;

-- Text Datatype
-- Display first_name,salary of Neena 
select first_name,salary from employees where first_name='Neena';
select * from employees;

-- Display all the details of employee whose first_name is Bruce.

--Display all the employees hired on 1987-06-17
select * from employees where hire_date='1987-06-17';

-- Operators 
--AND Operators-- both conditions should be true
--OR Operator 
-- LIMIT Operator
-- Display all the details of employees having salary greater than 5000 and are in department_id=5
select * from employees where salary > 5000 and department_id=5;

-- Display all employees whose manager_id=100 and salary is greater than 10000
select * from employees where manager_id=100 and salary >10000;
 
--OR Operator 
-- Display all the employees working in department_id=6 or department_id=9

select * from employees where department_id=6 or department_id=9;

-- LIMIT Operator 

-- Write a query that uses LIMIT Command to restrict the result set to only 15 rows.
select first_name,salary from employees LIMIT 15;


-- IN Operator -allows to specify a list of values to include
-- Display first_name,salary from employees who are working in the listed departments-10,2,5
select first_name,salary,department_id from employees where department_id in (10,2,5);



--Display first_name,salary from employees whose names are 'Neena','Nancy','John'
select first_name,salary from employees where first_name in ('Neena','Nancy','John');

--BETWEEN --allows you to select only rows within a certain range 
-- Display first_name,salary ,department_id where salary ranges from 10000 to 20000
select first_name,salary,department_id from employees where salary between 10000 and 20000;

-- Exercises
--1. Display all the employees working with job_id=5 and with department_id=9
--2.Display first_name,phone_number,email,hire_date of employees earning salary between 4000 and 16000

--- LIKE Operator 
--LIKE allows to match similar values instead of exact VALUES
--%-- wild card operator -ignore more than one charachter
-- _ wild card operator -ignore only one charachter 

-- Display all the employee details of employees whose first_name starts with N
select * from employees where first_name like 'N%';

-- Display first_name,phone_number,email,hire_date,manager_id of all employees whose name starts with 'A'
select first_name,phone_number,email, hire_date, manager_id from employees where first_name LIKE 'a%';

-- Display all the employee details of employees who have two 'e' in between in first_name
select * from employees where first_name like '%ee%';


-- Display all employee details having first_name ending with 'e'
select * from employees where first_name like '%e';
-- Using '_' underscore operator

-- Display all employees first_name,hire_date,email having second letter 'o' in their first_name.
select first_name,hire_date,email from employees where first_name like '_e%'

select * from employees;

-- Display all employees whose first_name is three charachters and the name ends with 'x'

select first_name from employees where first_name like '__x';

-- IS NULL Operator
unknown value,data doent exist, at that point data doesnt exist--NULL Value

-- Display all employees whose manager_id is NULL
select * from employees where manager_id is null;

-- Not-- allows to select the rows that do not match certain condition
-- Display first_name,phone_number,email,department_id of all employees who are not in department_id=10,2,3
SELECT first_name,phone_number,email,department_id from employees where department_id not in(10,2,3);

-- Functions
-- Single row functions 
-- Different types of functions
--Number Functions
-- Charachter Functions
-- working Date 
-- 1. Number Functions
select 22+10;
--abs()
select abs(-9.5);

-- Display all the employees first_name,salary,salary with increment of Rs 100 to all employees
select first_name,salary,salary+100 as Increment from employees;

-- Display first_name,salary,annual salary (salary*12) from table employees

select first_name, salary, salary*12 as 'Annual salary' from employees;


--Charachter Functons --charachter/textual DATA Functions

-- upper()
--Display all the first_name in upper CASE
select upper(first_name) from employees;

--lower()
-- Display all the first_name in lower CASE

select lower(first_name) from employees

-- substr(columnname/text,startnumber,endnumber)
-- Display first three letter from first_name
select first_name,substr(first_name,1,3) from employees;

--Display 'Hero' from the word 'HeroVired' using substr() function

select 'Hero Vired', substr('Hero Vired', 1,4);
SELECT substr('HeroVired',1,4);

--Display 'Sun' from the word 'Sunday' using substr() function
select 'sun' , substr('sunday' , 1 ,3);

-- Display first_name,first three letters of first_name using substr() from employees TABLE

select first_name,substr(first_name,1,3) from employees;




-- instr --position of the first occurence charachter
-- first_name position number of first 'e' 
select first_name,instr(first_name,'e'),substr(first_name,1,3),upper(first_name),lower(first_name) from employees;

-- replace
select replace('Black','Bl','J');

--Distinct --unique values of the specified column
--7. Create a query to display the unique manager numbers from the Employees table.
select DISTINCT(manager_id) from employees;


6. Create a query to display the last name concatenated with the first name, separated by space, and the telephone number concatenated with the email address, separated by a hyphen. Name the column headings “FULL_NAME” and “CONTACT_DETAILS” respectively (Employees tables).

select first_name,last_name,first_name||' '||last_name,phone_number||'_'||email from employees;



