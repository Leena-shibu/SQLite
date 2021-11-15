--Revision Day 2 --Aggregate Functions
-- avg,count,min,max,sum

--Group by Clause 
--Having Clause
-- Group by multiple columns
--||
--Date(),strftime()
--DDL-CREATE,ALTER,DROP
--DML-INSERT,DELETE,UPDATE
-- Retrieve todays date
select date('now');

--Agenda
-- Joins --to combine records from two or more tables in a database 
--Types of Joins
--Cross JOIN
-- Inner Join 
--Outer Join 
--Self Join 

--Cross Join --cartesian product of both tables
select * from emp;4 rows ==12 rows 
select * from dept;3 rows 

17 lakh  records --cross join check of performance of system --used for testing 

select * from emp,dept;
select * from emp cross join dept;

-- Write a query to display cross join of employees table with departments tables
select * from emp cross join dept;

Inner Join --
--Display department name of all employees names
--first way 
select ename,dname,emp.deptid from emp inner join dept on emp.deptid=dept.deptid;
select * from dept;



--Use alias 
display ename,dname,deptid,location

select ename,dname,d.deptid,location 
from emp  e inner join dept d       
on e.deptid=d.deptid   

-- Display first_name,department name ,department id from employees and departments 
select first_name,department_name,employees.department_id 
from employees inner join departments  on employees.department_id = departments.department_id;


-- Joining 3 tables 

---- Display first_name,department name ,department id,city  from employees ,departments ,locations
select first_name,department_name,employees.department_id,locations.city
from employees inner join departments on employees.department_id=departments.department_id
inner join locations on  departments.location_id=locations.location_id;


-- Display first_name,salary,department name ,hire_date for all employees from employees and departments 


--Joins-
--Cross Join 
-- Inner Join 10=10
-- Outer Join 

Left Outer Join 


--1. Display all the employees who are assigned departments and also employees who arent assigned departments

select ename,emp.deptid,dname from emp left outer  join dept on emp.deptid=dept.deptid;


-- Display departments with or without employees
-- emp and dept table 

select ename,dept.deptid,dname from  dept left join emp on emp.deptid=dept.deptid

select dname,d.deptid,ename from dept d
left  outer join emp e on e.deptid=d.deptid;







Right Outer Join 
Full Outer Join 







--Dept Master table 
--emp detail table 
--jOINS --Combine used to combine 2 or more table 
--2 tables --1 condition 
n tables --(n-1) join condition 
3 tables --2 join condition 

1,2,3 --

-- Display first_name






-- when longer table names saves time,less spelling mistakes 









--Use Joins with Group by 
--Please download emp.csv dept.csv

select * from emp;
select * from dept;
