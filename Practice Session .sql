CREATE DATABASE PRACTICE;
SHOW DATABASES;
USE practice;

show Tables

CREATE TABLE Worker 
( 
  Worker_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,  
  First_Name CHAR(25),
  Last_Name CHAR(25),
  Salary INT(15),
  Joining_Date DATETIME,
  Department CHAR(25)
);  

Insert INTO Worker 
    (Worker_id, First_Name, Last_Name, Salary, Joining_Date, Department) 
    VALUES
    (001, 'Monika' , 'Arora', 100000, '14-02-20 09:00:00'  , 'HR'),
    (002, 'Niharika' , 'Verma', 80000, '14-06-11 09:00:00' , 'Admin'),
    (003, 'Vishal' , 'Singhal', 300000, '14-02-20 09:00:00' , 'HR'),
    (004, 'Amitabh' , 'Singh', 500000, '14-02-20 09:00:00' , 'Admin'),
    (005, 'Vivek' , 'Bhati', 500000, '14-06-11 09:00:00' , 'Admin'), 
    (006, 'Vipul' , 'Diwan' , 200000 , '14-06-11 09:00:00' , 'Account'),
    (007, 'Satish' , 'Kumar' , 75000, '14-01-20 09:00:00' , 'Account'),
    (008, 'Geetika' , 'Chauhan' , 90000, '14-04-11 09:00:00' , 'Admin'); 
        
SELECT * FROM Worker;

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
    ON DELETE CASCADE
);

INSERT INTO Bonus
       (WORKER_REF_ID , BONUS_AMOUNT , BONUS_DATE)
       VALUES
       (001, 5000, '16-02-20'),
		   (002, 3000, '16-06-11'),
		   (003, 4000, '16-02-20'),
		   (001, 4500, '16-02-20'),
		   (002, 3500, '16-06-11');
		   
SELECT * FROM Bonus;

CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title
         (WORKER_REF_ID , WORKER_TITLE , AFFECTED_FROM)
         VALUES
          (001, 'Manager', '2016-02-20 00:00:00'),
          (002, 'Executive', '2016-06-11 00:00:00'),
          (008, 'Executive', '2016-06-11 00:00:00'),
          (005, 'Manager', '2016-06-11 00:00:00'),
          (004, 'Asst. Manager', '2016-06-11 00:00:00'),
          (007, 'Executive', '2016-06-11 00:00:00'),
          (006, 'Lead', '2016-06-11 00:00:00'),
          (003, 'Lead', '2016-06-11 00:00:00');
    
SELECT * FROM Title;

-- Query 1
select first_name AS worker_name from worker;

-- Query 2
select upper(first_name) from worker;

-- Query 3
select Distinct(department) from worker;

-- Query 4
select Department from worker Group by department;

-- Query 5
select substring(first_name, 1, 3) from worker;

-- Query 6
select instr(first_name, 'b' ) from worker where first_name = 'amitabh';

-- Query 7
select rtrim(first_name) from worker;

-- Query 8
select distinct(department), length(department) from worker;

-- Query 9
select replace(first_name, 'a' , 'A') from worker;

-- Query 10
select Concat(first_name, ' ' ,last_name) from worker;

-- Query 11
select * from worker order by first_name asc;

-- Query 12
select * from worker order by first_name asc ,department desc;

-- Query 13
select * from worker where first_name IN ('Vipul' , 'Satish');

-- Query 14
select * from worker where first_name Not in ('vipul' , 'satish');

-- Query 15
select * from worker where department = 'admin%';

-- Query 16
select * from worker where first_name like '%a%';

-- Query 17
select * from worker where first_name like '%a';

-- Query 18
select * from worker where first_name like '_____h';

-- Query 19
select * from worker where salary between 100000 AND 500000;

-- Query 20
select * from worker where YEAR(joining_date) = 2014 AND MONTH(joining_date) = 02;

-- Query 21
select department , COUNT(department) from worker where department = 'admin';

-- Query 22
select Concat(first_name, ' ' ,last_name) from worker where salary between 50000 AND 100000; 

-- Query 23
select department, Count(worker_id) AS number_of_worker from worker group by department order by count(worker_id) desc ;

-- Query 24
select * from worker as w inner join title as t on w.worker_id = t.worker_ref_id where t.worker_title = 'manager';

-- Query 25
select worker_title, count(*) from title group by worker_title having count > 1;

-- Query 26
select * from worker where mod(worker_id, 2) != 0;

-- Query 27
select * from worker where mod(worker_id, 2) = 0;

-- Query 28
Create table worker_clone like worker;
insert into worker_clone select * from worker;
select * from worker_clone;

-- Query 29
select worker.* from worker inner join worker_clone using (worker_id);

-- Query 30
select * from worker left join worker_clone using (worker_id) where worker_clone.worker_id is null;

-- Query 31
select curdate();
select now();

-- Query 32
select * from worker order by salary desc limit 5;

-- Query 33
select * from worker order by salary desc limit 4,1;

-- Query 34
select first_name , salary from worker w1
where 4 = (
    select count(distinct w2.salary)
    from worker w2
    where w2.salary >= w1.salary
);

-- Query 35
select w1.* from worker w1 , worker w2 where w1.salary = w2.salary AND w1.worker_id != w2.worker_id; 

-- Query 36
SELECT first_name, salary
FROM worker
WHERE salary = (
    SELECT MAX(salary)
    FROM worker
    WHERE salary < (
        SELECT MAX(salary)
        FROM worker
    )
);

-- Query 37
select * from worker union all select * from worker order by worker_id;

-- Query 38
select worker_id from worker where worker_id not in (select worker_ref_id from bonus);

-- Query 39
select * from worker where worker_id <= (select count(worker_id)/2 from worker);

-- Query 40
SELECT department, COUNT(department) AS deptcount
FROM worker
GROUP BY department
HAVING deptcount < 4;

-- Query 41
select * from worker where worker_id = (select max(worker_id) from worker);

-- Query 42
select * from worker where worker_id = (select min(worker_id) from worker);

-- Query 43
select * from worker order by worker_id desc limit 5;

-- Query 44
select max(salary) as maxSalary , department from worker group by department;

-- Query 45
select w.department, w.first_name, w.salary from (select max(salary) as maxSalary , department from worker group by department) temp 
inner join
worker w on temp.department = w.department and temp.maxsalary = w.salary;

-- Query 46
select distinct(salary) from worker w1 
where 3 >= (select count(distinct salary) from worker w2 where w1.salary <= w2.salary) order by w1.salary desc;

select distinct salary from worker order by salary desc limit 3;

-- Query 47
select distinct(salary) from worker w1 
where 3 >= (select count(distinct salary) from worker w2 where w1.salary >= w2.salary) order by w1.salary asc;

-- Query 48
select distinct(salary) from worker w1 
where n >= (select count(distinct salary) from worker w2 where w1.salary >= w2.salary) order by w1.salary asc;

-- Query 49
select department, sum(salary) as deptsalary from worker group by department order by deptsalary desc;

-- Query 50 
select first_name , salary from worker where salary = (select max(salary) from worker);

-- Query 51
create table pairs(
A int ,
B int
);

insert into pairs values (1,2) , (2,4) , (2,1) , (3,2) , (4,2) , (5,6), (6,5), (7,8);
select * from pairs;

-- remove reverse pairs
-- method 1 : Joins

SELECT * 
FROM pairs Lt 
LEFT JOIN pairs Rt 
ON Lt.A = Rt.B AND Lt.B = Rt.A
WHERE Rt.A IS NULL OR Lt.A < Rt.B;


-- method 2 : corelated subquery
select * from pairs p1 where not exists ( select * from pairs p2 where p1.B = p2.A AND p1.A = p2.B AND  p1.A > p2.A);