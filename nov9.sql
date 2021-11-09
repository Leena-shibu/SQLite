-- Revision --Day 1
-- Group by --
-- Create table 
--Insert 
--Delete 
--update 

Like %--ignore more than 1 charachter
     _-ignore only 1 charachter
	 
	 
	 --Single row function
	 Number function-+,-,*,/
	 select abs(-7.88)as 'Absolute';
	 Charachter Functions
	 select substr(first_name,1,4) from employees;
	 select instr(first_name,'e') from employees;
	 select replace ('Herovired','Hero','V');
	 select upper(first_name),lower(first_name) from employees;
	 
	 concat operator--symbol --||
	 select first_name||' '||last_name as 'Full Name' from employees;
	 select * from employees;
	 oracle,mysql --concat(first_name,last_name)
	 
	 -- Display in following format
	 --Steven King works in department 9
	 select first_name||' '||last_name||' '||'works in'||'department'||' '||department_id from employees;
	 
	--  Steven King was hired on 1987-06-17
	 --Sorting data in ASC
	 --default --
	 -- order data on text,numeric
	 -- Display first_name,salary,department_id order in ascending order 
	 select first_name,salary,department_id from employees order by salary;
	 
	--desc
	 select first_name,salary,department_id from employees order by  desc;

--Display the first_name,hire_date,phone_number,email in descending order of first_name
================================================================================================

--Group By Clause
--SYNTAX 
SELECT <COLUMNNAME>
FROM <TABLENAME>
WHERE <CONDITION>
GROUP BY <COLUMNNAME>
ORDER BY <COLUMNNAME>
-Aggregate functions
--sum
-- min
--max
--count
-- AVG 

-- Write a query to find maximum salary from employees table department  wise

select department_id,max(salary) 
from employees 
group by department_id;

-- -- Write a query to count of employees department wise 

select department_id,count(employee_id) from employees group by department_id;

-- Write a query to display sum of salary deparment wise.

select department_id, sum(salary) from employees group by department_id;

select department_id,sum(salary) from employees group by department_id;

--Write a query to display average salary,count of employees department wise,job wise 

--Grouping on multiple columns 
select * from  employees;


select department_id,job_id,avg(salary),count(employee_id) from employees group by department_id,job_id;

-- Write a query to display maximum salary departmentwise,job wise
SELECT department_id,job_id,max(salary) as 'MAX' from employees group by department_id,job_id;

-- Write a query to display number of employees,total salary paid to employees who work in each department.

--Having clause with GROUP BY Cluase
select <> from <tablename>
where <condition>
group by <columnname>
having <condition( aggregate function(sum,min,max,count,avg)
order by 

Where Clause --used before Grouping <use columnnames>
Having Clause --used after grouping ,aggregate functions

-- Write a query to display number of employees,total salary paid to employees who work in each department having count of employees greater than 2.
select department_id,count(employee_id), sum(salary) from employees group by department_id having count(employee_id)>2;

-- Write a query to display sum of salary department wise and the department number is greater than 3
select department_id,sum(salary) as 'Sum Salary'  from employees where department_id >3 group by department_id; 

--Write a query to display sum of salary department wise having sum of salary greater than 25000

select department_id,sum(salary) from employees group by department_id having sum(salary)>25000 ;

-- Display max(salary) of department_id=8 and job_id =15
select max(salary),department_id,job_id from employees where department_id=8 and job_id=15 group by department_id,job_id; 
--
--1. Write a query to display minimum salary department wise,job wise having min salary greater than 5000
--2.Write a query to display count  of employees job wise

-- Working with Dates
--Sqlite 3 main datatypes
TEXT
Integer
Real  9.2 

--Date default date format -YYYY-MM-DD
select hire_date from employees;
select date(hire_date) from employees;

--current_date  now()
select date('now');

-- Display start of month of '2017-12-17'
select date('2017-12-17','start of month');
select hire_date,date(hire_date,'start of month') from employees;

--Display hire_date , hire_date with 'start of year' from employees table

SELECT hire_date,date(hire_date,'start of year') from employees;

--strftime
--Display hire_date,year of hire_date from employees TABLE
select hire_date,strftime('%Y',hire_date),strftime('%m',hire_date) from employees;
-- Display the current date 
-- Commands -DDL ( Data Definition Language Commands'
-- CREATE TABLE 
-- ALTER TABLE 
-- DROP TABLE 

--add rows to table 
-- DML -Data Manipulation Language 
INSERT--add a row 
DELETE --Delete a ROW
UPDATE -- Modify values of the row

--Create table <table_name> (
columnname datatype,
columnname2 datatype,
columnname3 datatype);

TEXT -- Charachter datatype 
Integer - whole number 
Real/decimal -- 1234.56  (6,2)
--Create table named as student 
create table student(id integer,
name text,
bdate text,
marks integer);

--INSERT -- add a row to the table 
-- INSERT INTO STUDENT(ID,NAME,BDATE,MARKS) VALUES (1,'TEST','1999-10-17',89);

--INSERT into student values(2,'Mark','2000-08-09',90)
INSERT into student values(3,'spencer','2000-06-09',91),(4,'Angela','2001-06-09',93);
select * from student;
select bdate,strftime('%Y',bdate) from student;

-- 1.Create table named as 'pizza' with the following columns 
pizza_id integer,
pizza_name text,
price INTEGER

--2. Add 3 rows to the table pizza
--3.Display all rows and columns from table pizza.

-- UPDATE A ROW 
Update table_name
set col1=value1,col2=value2,col3=value3;

Update table_name
set col1=value1,col2=value2,col3=value3
where [condition];
combine N number of conditions using AND/OR 
-- Update the price to 750  for pizza_id =3
 CREATE TABLE Pizza_table
(pizza_id integer,
pizza_name text,
price INTEGER);

INSERT INTO Pizza_table
VALUES (1,'Margarita',180),(2,'Paradise',250),(3,'Chicken Barbeque',300);

update Pizza_table
set price=750
where pizza_id=3;
select * from Pizza_table;


ALTER TABLE < tablename> rename  COLUMN <CURRENT_NAME> TO new_name

-- Update Pizza_table for all pizza prices to 300.

-- Delete Command

DELETE FROM <table_name>
WHERE <Condition>

-- Condition -- combine AND/OR operators

-- Delete a row from pizza table where pizza_id is 2

-- Update the table 

update Pizza_table
set price=800
where pizza_id=2;

select * from pizza_table;

insert into pizza_table values(4,'Cheese',350);

insert into pizza_table values(5,'Cheesy',450),(6,'Cheesymacroni',650);

=======================================
--.csv 
-- Practice questions
--1.Write a query to find the number of employees joined  in each year
--2.Write a query to find out minimum Salary in each department
--3.Remove the records whose first name starts with 'J' and last_name from end with 'n' from employees table
--4.Demonstrate to insert 4 rows in the jobs table in single insertion query

select * from employees;
delete from employees where first_name like 'J%' and last_name like '%n';






select strftime('%Y',hire_date),count(*) from employees
 group by strftime('%Y',hire_date);
delete from employees where first_name like 'f%' and last_name like '%e'























