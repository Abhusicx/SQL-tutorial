USE abhijeet;

select * from worker;

select Salary from worker;

select First_Name, Salary from worker;

select 44+11;

select now();

select ucase('LAKsHay');

select * from worker where Salary > 100000;

select * from worker where Department = 'HR';

select * from worker where Salary between 80000 AND 300000;

select * from worker where Department = 'HR' OR Department = 'Admin' OR Department = 'Account';

select * from worker where Department in ('HR' , 'Admin' , 'Account');

select * from worker where Department not in ('HR', 'Admin');

select * from worker where first_name like '%i%' AND last_name like '%i%';

select * from worker order by salary;

select * from worker order by salary DESC;

select distinct department from worker;

select department from worker group by department;

select department,count(department) from worker group by department;

select department, AVG(salary) from worker group by department;

select department, MIN(salary) from worker group by department;

select department, MAX(salary) from worker group by department;

select department, SUM(salary) from worker group by department;

select department, count(department) from worker group by department having count(department) > 2;

