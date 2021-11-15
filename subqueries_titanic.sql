# Dataset used: titanic.csv
# Use subqueries for every question

USE InClass;

#Q1. Display the first_name, last_name, passenger_no , fare of the passenger who paid less than the  maximum fare. (20 Row)
SELECT first_name, last_name, passenger_no, fare 
FROM titanic 
WHERE fare < (SELECT MAX(fare) FROM titanic);


#Q2. Retrieve the first_name, last_name and fare details of those passengers who paid fare greater than average fare. (11 Rows)
SELECT first_name, last_name, fare 
FROM titanic 
WHERE fare >= (SELECT AVG(fare) FROM titanic);

select * from titanic_ds;

#Q3. Display the first_name ,sex, age, fare and deck_number of the passenger equals to passenger number 7 but exclude passenger number 7.(3 Rows)
 SELECT passenger_no, first_name,sex, age, fare, deck_number 
 FROM titanic 
 WHERE   (sex,   deck_number  )IN (SELECT  sex,   deck_number  FROM titanic WHERE passenger_no = 7) and passenger_no<>7;

#Q4. Display first_name,embark_town where deck is equals to the deck of embark town ends with word 'town' (7 Rows)
select  first_name,embark_town from titanic where deck in(select deck from  titanic where embark_town like '%town');


