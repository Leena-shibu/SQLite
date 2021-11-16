--windows functions

--alter TABLE
--python sql connectivity 


Afternoon session

-- View
--Constraints 
--Case statement 

-- View --created on base/physical table
select * from employees;
-- Hr each department 

dept 2 --hr 
dept 3--hr 
Advantages of Views
1.Data hiding ---View department 
2.security data 
3.view on complex query --

create view v1_dept9 as select * from employees where department_id=9;

--- Backend 
v1_dept9   -----select * from employees where department_id=9;
--call a view
select * from v1_dept9; 

drop view v1_dept9;

-- Create a view v1 as all the details of employees having salary greater than 10000.

--
create view v1_dept91 as select first_name,department_id from employees where department_id=9;

select * from v1_dept91;

-- Constraints -rules enforced on data columns on a table 
database --collection data 
correct--important 
consistent --
integrity constraints --data stable
Constraints on database :
1. Not NULL
2.uNIQUE
3.pRIMARY KEY 
4.FOREIGN KEY
5.Check constraint 

1.Not null constraint 
-- column will not contain a null VALUES

create table company_n(
id int,
name text,
salary int not null,
age int);


-- Add a ROW
insert into company_n values(1,'test',null,20);

drop table company_n;
-- Unique constraint 

-- prevent two records having identical value in a particular column 
--also allows NULL Values ,more than one NULL VALUES
--each NULL Value different weightage in the database 


create table company_n(
id int unique,
name text,
salary int);
insert into company_n values(1,'test',30000),(1,'testvalue',300000);
insert into company_n values(null,'testtest',31000)
insert into company_n values(null,'test1',30000)
select * from company_n;
drop table company_n;


-- Primary key --not NULL
--unique --each value in the column will be unique 
--MYSQL ,Oracle not required 

create table company_n
(id int primary key not null,
name text,
salary int);
drop table company_n;
insert into company_n values(null,'test',4000);

--Create table student 
with following columns
1. Roll_no should be integer and not null,primary key 
2.Name should be TEXT
3.DOB should be text and unique 
4.marks whould be int 

-- Foreign Key 
--system 
dept--formed--master table  
1---PRIMARY KEY (DEPTNO) research
2 sales 
3 marketking 

emp  --
empno  ename (deptNO )fOREIGN KEY --REFER MASTER TABLE(pRIMARY KEY)
1       test  1
2       mARK   2 

--D DEPARTMENT TABLE E-EMPLOYEE TABLE
-- mASTER TABLE
CREATE TABLE D( DEPTNO INT PRIMARY KEY NOT NULL,
DNAME TEXT);
-- Detail TABLE
create table e(empno int primary key not null,
ename text,
deptno int references D(DEPTNO));
- Foreign key can contain a null value
--add a row of following data 
insert into d values(1,'sales');

insert into e values(100,'test',10);

--Not NULL
--UNIQUE
--primary KEY
--foreign key 
-- check CONSTRAINT
--enables a condition to check the value being entered into a record


drop table company_n;
create table company_n (
id int primary key not null,
ename text,
age int check(age>18));
insert into company_n values(1,'test',16);

--WE CAN have more than 1 foreign key in a single TABLE
-- only have one primary key in a table 

select length(first_name) from employees;

-- Case statement 



--1960 data --automation 

1980 to 1990 databases --Oracle 1995 --3.0 -- constraints 
Banks automation 

internet --dial up modem
--Alter 

create table 
Add a new column 
alter table --alter/change/modify column 
create table e1(id int,
name text);

-- add one more column phonenumber 

alter table e1 
add column phonenumber text;
DDL-- CREATE,ALTER,DROP --TABLE/VIEW 
UPDATE E1 
SET PHONENUMBER='101'
WHERE ID=2;
 
--Case statement 
--if else ladder 
case when <condition> THEN 
     when <condition> then 
else ' '
end 

-- salary >=10000 display 'A'
--SALARY >=7000 display 'B'
--salary >=5000 display 'C'
else 'Sorry failed'

select first_name,salary,department_id,case when salary >=20000 then 'A+'
       when salary >=10000 then 'A'
	   when salary >=7000 then 'B'
	   when salary >=5000 then 'C'
	   else 'Sorry'
	   end as Grade from employees
	   order by Grade;
	   
-- set operations
union-- bring all data removing duplicate data
union all --all data with duplicates 
select * from employees;
	--List all the departments from employees and department TABLE using union operation
	--Set operations
	select department_id from employees
	union 
	select department_id from departments;
	
	
	select department_id from employees
	union all
	select department_id from departments;
	
	--Practice questions
	select * from nutrients;
	
--1. Display all food having 'o' at the last value
--2.Display all food details having calories between 100 and 130 
--3. Display  all foods which are rich in Vitamin A (having Vitamin A Value greater than 50)
--4. Help the patients in hospital to display top three food rich in Vitamin C 
SELECT food, VitaminC from Nutrients order by VitaminC DESC limit 3;

--5.Rank the food according to Pottassium rich Food
SELECT food, Potassium , dense_rank () over (order by Potassium desc) as K_rank from Nutrients;

--6.create a view of food,protein,calcium and iron having protein greater than 15.0
	
--7.Find the next offset in Vitamin C using lead() function 

	select food,VitaminC,lead(VitaminC) over (order by VitaminC desc) from Nutrients
	;
nthvalue --
lead()

--sql 
select * 
column wise
--operators
Limit,in,like ,between,
Function
number- abs() charachter -substr,instr,replace,upper,lower
date -- date() strftime
order by 
--group by 
where and having ---
--Joins
inner join 
outer -left join 
cross join 
self join 

---
subquery 
--single ROW
--multirow row >,in
-- From clause 
-- corelated subquery 
--exists cluase --boolean true/false

-analytical function
aggregate -min,max,sum,count,avg
ranking functions--- rank,dense_rank,percent_rank,cume-dist 
anayltical window functions -- lead(),lag(),first_value(),last_value(),ntile,nth_value
--Python and sql connectivity
Alter TABLE
constraints
--not null,primary key,foreign key,unique ,check 
leena.shibu@herovired.com
views
case statement -- if else statement 
--Big data 
---table 
sql --table format 

--.json ,.xml 
hadoop --sql 
spark sql sql 
table format 

1960 -- strcuture 
rdbms --table --oracle-- payable version license,sqlserver,postgre,mysql,sqlite --opensource 
sql --grammer ANSI-SQL --power 
amazon,futuregroup 
18 companies --
sale --diwali 
metro,less metro ,sale shop forecasting -20lakhs 
one langauge --
dataengineer 
pandas --- numerical array [pixel data]
nosql --unstrcutured data .json,.xml 
4 columns 
1 row 4 columns
1 row 10 columns 
nosql --any strcuture
mongodb,cassandra 
.json 
1 school classmate --attributes 5 
amazon--products 
keystroke,monitored algorithms 
fraud detection 
.json 
tuple pandas 
key ->value 
name->'test',id->'100',salary->'3000'
name->'schoolfriend',schoolactivity->'skit'



password  --form 
owner --secs 
fraud --some more delay --raise alaram 
pl/sql 


college --10
internship -15 









hirerachical strcture --tree pointers ---did not work 
network -link structure --pointers 
	
	
	
	
	   
select * from nutrients;

















create table a (a1 int primary key);
create table b ( b2 int references a(a1));













--SELECT COUNT(*)
FROM businesses;

SELECT *
FROM businesses
LIMIT 5;

SELECT name
FROM businesses
LIMIT 5;

SELECT name
FROM businesses
WHERE name like '%PIZZA'
LIMIT 10;

select * from inspections;
SELECT MIN(date), MAX(date)
FROM inspections;

