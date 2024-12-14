USE ORG;

-- Inner Join
SELECT e.id, e.fname, e.lname, p.id, p.name 
FROM employee AS e
INNER JOIN project AS p 
ON e.id = p.empID;

-- Inner Join without using INNER JOIN keyword
SELECT e.id, e.fname, e.lname, p.id, p.name 
FROM employee AS e, project AS p 
WHERE e.id = p.empID;

-- Right Join
SELECT p.id, p.name, e.fname, e.lname, e.emailID 
FROM employee AS e
RIGHT JOIN project AS p 
ON e.id = p.empID;

-- Cross Join
SELECT e.fname, e.lname, p.id, p.name 
FROM employee AS e
CROSS JOIN project AS p;

-- Set Operations

-- Union
SELECT * FROM department AS dept1
UNION
SELECT * FROM department AS dept2;

-- Union with condition
SELECT * FROM department AS dept1 WHERE role = 'salesman'
UNION
SELECT * FROM department AS dept2 WHERE role = 'salesman';

-- Inner Join between two departments
SELECT * FROM department AS dept1 
INNER JOIN department AS dept2 
ON dept1.empID = dept2.empID;

-- Intersect
SELECT dept1.*
FROM department AS dept1
INNER JOIN department AS dept2 
ON dept1.empID = dept2.empID;

-- Minus (Emulated with LEFT JOIN and NULL check)
SELECT dept1.*
FROM department AS dept1
LEFT JOIN department AS dept2 
ON dept1.empID = dept2.empID
WHERE dept2.empID IS NULL;

-- Subqueries

-- Subquery: Employee with age in a certain range
SELECT * 
FROM employee 
WHERE age IN (SELECT age FROM employee WHERE age > 30);

-- Subquery: Employees working on multiple projects
SELECT * 
FROM employee 
WHERE id IN (
    SELECT empID 
    FROM project 
    GROUP BY empID 
    HAVING COUNT(empID) > 1
);

-- Subquery: Employees older than the average age
SELECT * 
FROM employee 
WHERE age > (SELECT AVG(age) FROM employee);

-- Subquery: Maximum age of employees whose first name contains 'a'
SELECT MAX(age) 
FROM (SELECT * FROM employee WHERE fname LIKE '%a%') AS temp;

-- Correlated Subquery

-- Correlated subquery to find employees ranked 3rd by age
SELECT * 
FROM employee e1
WHERE 3 = (
    SELECT COUNT(e2.age)
    FROM employee e2 
    WHERE e2.age >= e1.age
);

-- View
select * from employee;

-- creating a view 
create view custom_view as select fname, age from employee;

-- viewing from the view
select * from custom_view;

-- altering the view
alter view custom_view as select fname, lname, age from employee;

-- dropping the view
drop view if exists custome_view;