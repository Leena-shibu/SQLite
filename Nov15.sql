SQL Revision

1. select rows and columns 
select  * from employees;

--Operators 
AND,OR ,Comparision operators,IN,BETWEEN ,LIKE '%','_',LIMIT 
SORTING --ORDER BY ,DESC 

SQL Functions
Numeric functions--ABS(),
Charachter functions--- Upper,Lower,instr,substr,replace
Distinct ---
Date -- date(),strftime  -- %d,%Y

-- Group by ,Having 
-- Joins 
Inner Join,Left Join,Self Join ,Cross Join 

-- Sub query -query inside a query --inner query 

outer query 
-- Display firstname of person earning maximum salary
---'=' used for single value
--inner query returns single value
select first_name,department_id from employees where salary = (select max(salary) from employees);

Types of Subquery:
1.Single row subquery  --returns single value in inner query 
select first_name,department_id from employees where salary = (select max(salary) from employees);

2.Multi row Subquery  -- return more than one value in inner query 
3.Derived Table /From Clause  -- query is written in FROM Clause 
4.Corelated subquery -- 

2. Multirow subquery >,<,in --subquery return more than one ROW
select first_name,salary,department_id from employees where salary > (select salary from employees where department_id=2);

select salary from employees where department_id=2
--IN Clause
Equality Operator ----

--Display first_name,salary,department_id of all employees whose department_name is Executive or Sales
select * from departments;

select first_name,salary,department_id from employees where department_id in 
(select department_id from departments where department_name in ('Executive','Sales'));

EXISTS Clause--Logical Operator --True/False 
--check rows are present 
-- a boolean operator that returns true or false
--used to test existence of rows returned by subquery 
--faster because it terminated further procsessing when immediately finds matching rows---improves performance  query 
														IN ('Sales')
select first_name,department_id from employees a where EXISTS (select department_id from departments where  a.department_id=departments.department_id and 
 departments.department_id >2);

-- From Cluase
-- derived table is similar to temporary table
select * from (select * from employees where department_id=5)dep5 where dep5.salary >5000;
-- Display max salary of employees from department_id 5.-- From Clause

select max(salary) from (select * from employees where department_id=5);


--Corelated subquery 
--is a subquery uses values from outer query 
---inner query has to be executed for every row of the outer query 
--computationally intensive 

select first_name,salary,department_id from employees where department_id in 
(select department_id from departments where department_name in ('Executive','Sales'));

-- Display first_name,salary,department_id whose department_name is 'Executive','Sales'

select first_name,salary,employees.department_id
from employees inner join departments on employees.department_id=departments.department_id
and department_name in ('Executive','Sales');

--Display first_name,last_name,department_id,salary greater than average salary of their department

select first_name,last_name,department_id,salary from employees e where salary >(select avg(salary) 
from employees where e.department_id=employees.department_id);

select first_name, last_name, department_id, salary from employees e 
where salary > (select avg(salary) from employees);

-- Comparision between subquery,joins-interchangeably 
--subquery --joins 
--easy to write 
--break down problem 
--Joins --intensive 
--subquery -titanic 

--Windows Analytical Functions
--rank()

--ranking 
--with gaps/skipping 
Using rank function display order of salary

select first_name,department_id,salary,rank() over (order by salary DESC ) as ranking from employees;

--Syntax
  RANK()
functionname()OVER 
			(PARTITION BY <condition>
			  Frame by  Clause <condition> 
			  order By <condition>)
			  
--PARTITION BY --grouping of rows 
-- Using rank function display order of salary department wise 
select first_name,department_id,salary,rank() over (PARTITION by department_id order by salary desc ) as ranking
from employees;

-- dense_rank---
--without gaps/no skipping 

---- Using rank function display order of salary department wise
select first_name,department_id,salary,dense_rank() over (PARTITION by department_id order by salary desc ) as ranking
from employees;

-- Display name,department_id,salary job wise using dense ranking 

select first_name,department_id,salary,job_id, 
dense_rank() over ( PARTITION by job_id order by salary) as ranks from employees;



--Display first_name,age,fare survived wise using rank function on fare column 
select * from titanic;

select first_name,age,fare,survived,
dense_rank() over (partition by survived order by fare desc) as "ranking" from titanic;

-- Display first_name,age using rank function on age column
select first_name,age, rank() over(order by age) as "age rank" from titanic;

select first_name,age,rank() over (order by age asc ) as ranking from titanic;

--
select * from (select *,row_number() over (partition by department_id order by salary desc) as r from employees)  e where e.r <3;

-- Windows
aggregate functions

select max(salary) from employees;
-- Display department_id,max(Salary) department wise using group by clause

select *,max(salary) over(partition by department_id order by salary) from employees;
select department_id,max(salary)
from employees
group by department_id;

-- Aggregate windows
-- Ranking functions
-- Anaytical functions

1.rank()
select first_name,department_id,dense_rank() over(partition by department_id order by salary) as r from employees;

2.dense_rank()

3.percent_rank()--percentile
--(rank -1)/(total_rows-1)

-- Calculate percent_rank of salary department wise

select employee_id,first_name,department_id,salary ,percent_rank() over (PARTITION by department_id order by salary) as percentile
from employees;

-- Calculate percentile of fare based on survival 
SELECT fare,survived, percent_rank() 
over (partition by survived ORDER by fare) as percentile from titanic;

-- row_number() ---row_number to each row -- top 2 employees of each department 
select *,row_number() over (order by salary) from employees where department_id=2;
-- used updating a row 



--extra use of rownumber 
select * from (select *,row_number() over (partition by department_id order by salary desc)as r
from employees ) e where e.r<3;



--cume_dist()-cumulative distribution 
0<cume_dist<=1
row_number/total_rows
--Cumulative distribution of salary in employees
select *,cume_dist()over (order by salary) from employees;

-- Cumulative distribution of salary department wise

SELECT *, cume_dist() over (partition by department_id order by salary) from employees;

--ntile(4)--divide rows into buckets on salary   12 -- 3rows 13 rows -4 --3--3
-- count total number of ROWS
--divide by number specified 
-- if odd extra rows will be assigned in first buckets 
select employee_id,salary,ntile(4) over (order by salary) bucket_no 
from employees;

-- Display all the employee details with salary in 3 buckets

Lead() -next row value 

select first_name,department_id,salary,lead(salary,2) over (order by salary) as dreamsalary 
from employees;

--Display all employee details with next dreamsalary department wise

-- Display all employee details with next senior hired from employees
-- use hire_date 

Lag()

--Junior hired

select employee_id,first_name,department_id,salary ,hire_date,lag(hire_date) over (order by hire_date) from employees
-- who earns less than the present employee using Lag() function


select first_name,salary,lag(salary,1,'Nobody') over (order by salary),lag(first_name) over (order by salary) from employees;

 













select * from employees;

--











