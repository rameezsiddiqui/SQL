CREATE DATABASE COLLEGE;
USE COLLEGE;
CREATE TABLE STUDENT (
rollno INT PRIMARY KEY,
name VARCHAR(50),
marks int not null,
grade varchar(1),
city varchar(20));
insert into student( rollno,name,marks,grade,city) values (101,"anil",78,"C","pune"),
(102,"bhumika",93,"A","Mumbai"),
(103,"chetan",85,"B","Mumbai"),
(104,"dhruv",96,"A","Delhi"),
(105,"enamuel",82,"B","Delhi");

select * from student where marks >80;
select * from student limit 3; #3  cities
select * from student order by marks desc limit 3;  #top 3 student wrt marks
select max(marks) from student; #aggregate functions takes a lot and return one
select min(marks) from student;
select count(rollno) from student;
select avg(rollno) from student;
select city , count(name) from student group by city;
select city,avg(marks) from student group by city order by city asc; # order by city ascending, and with average marks and group by city
select grade , count(grade)
from student
group by grade;
select city , count(name) from student group by city having count(city)>=1; #select city and then group then it select city count greater than 1
set sql_safe_updates=0; #off the safe mode off 
update student
set grade= "O" where grade="A";  #update the table
select * from student;
set sql_safe_updates=1;#off the safe mode on (dont allow update anything in table)
set sql_safe_updates=0;
update student
set marks=marks_1; #add marks to all
select * from student;
delete from student where marks < 80;
select * from student;  # deleting studnets
#delete from student (it delete all the values)
select * from college;
#Drop TABLE principal;

select * from student;
ALTER TABLE college
ADD COLUMN STUDENT INT;

SHOW TABLES;
ALTER TABLE student ADD COLUMN STUD INT;
SHOW TABLES;
select * from student;
ALTER TABLE student Drop STUD   #DROPPING STUDENT COLUMN
;
SHOW TABLES;
ALTER TABLE student MODIFY city varchar(60);   #modify column

truncate table student;   # delete all data inside the table, different from Drop, as Drop delete table, wile it only delete table contents
select * from student;
ALTER TABLE student change city cities varchar(60);
select * from student;
set sql_safe_updates = 0;
Delete from student where marks<5;
set sql_safe_updates = 01;

insert into student( rollno,name,marks,grade,cities) values (101,"anil",78,"C","pune"),
(102,"bhumika",93,"A","Mumbai"),
(103,"chetan",85,"B","Mumbai"),
(104,"dhruv",96,"A","Delhi"),
(105,"enamuel",82,"B","Delhi");
select * from student;


CREATE TABLE COURSE (
rollno INT PRIMARY KEY,
Course_name VARCHAR(50)
);

insert into COURSE( rollno,Course_name) values (101,"maths"),
(102,"physics"),
(103,"chemistry"),
(104,"physics");
DELETE FROM COURSE WHERE rollno = '103';
select * from course;
select * from student inner join Course on student.rollno = Course.rollno; #Join one table with another using inner join 
select * from student left join Course on student.rollno = Course.rollno; #Join one table with another using left join 
select * from student right join Course on student.rollno = Course.rollno; #Join one table with another using left join 
select * from student left join Course on student.rollno = Course.rollno 
union
select * from student right join Course on student.rollno = Course.rollno; #Join one table with another using full join (the command is FULL Join in ORACLE) 

select * from student left join Course on student.rollno = Course.rollno where Course.rollno is null; #Left exclusie join
CREATE TABLE EMPLOYEE (
id INT PRIMARY KEY,
name VARCHAR(50), mid VARCHAR(50));

insert into EMPLOYEE values (101,"RAMEEZ",103),
(102,"SAAD",101),
(103,"MEENA",102),
(104,"TINA",NULL);

ALTER TABLE EMPLOYEE
MODIFY COLUMN mid int;

select * from employee;
select a.name as manager_name,b.name as name from EMPLOYEE AS a JOIN EMPLOYEE AS b on a.id =b.mid;

select name from employee union select name from employee; #union gives unique
select name from employee union all select name from employee; #union all gives duplicates
select * from student;
select avg(marks) from student;  #find the average onmarks column
select name from student where marks > 86.8;
select name from student where marks > (select avg(marks) from student);  #subquery ,here we are getting the names of students whose marks are greater than avg marks
select name from student where rollno%2 = 0;   #find the even rollnumber and get the name
select name,rollno from student where rollno in (select rollno from student where rollno%2 = 0 ); #we select those rollnumber names whose rollno are even using WHERE clasue subquery.
Select * from student where cities = "Delhi";
Select max(marks) From (select * from student where cities = "Delhi") as temp; # we are geting max marks from Delhi students, this is the example of Subquery in FROM clause.
select max(marks) from student where cities = "Delhi";  #same result as above but we are trying to solve it using subquery

Select  (select max(marks) from student), name from student;  #using subquery to fetch name and max marks from student table. not widelyuse but just for practice.

create view view1 as select rollno,name from student;  #this creates a virtual table having name view1 which is beneficial for data hiding, etc



