Create database companyproject;
use companyproject;
create table Employees(
emp_id int,
emp_name varchar(50),
dept_id int,
salary int );

select*from Employees;
insert into Employees(emp_id,emp_name,dept_id,salary)
values(1,"Alice",101,6000),
	  (2,"Bob",102,7000),
      (3,"Charlie",103,8000),
      (4,"David",101,7500),
      (5,"Eve",102,8500);

create table Departments(
dept_id int,
dept_name varchar(20));

select * from Departments;

insert into Departments(dept_id,dept_name)
value(101,"HR"),
     (102,"sales"),
     (103,"IT"),
     (104,"Marketing");

create table projects(
project_id int,
project_name varchar(50),
dept_id int );

select * from projects;

insert into projects(project_id,project_name,dept_id)
values(1,"Project A",101),
      (2,"project B",102),
      (3,"project C",103),
      (4,"project D",104);
      
###Retrieve the employee name and dept name for each employee.###
Select Employees.emp_name,Departments.dept_name from Employees inner join Departments on Departments.dept_id=Employees.dept_id;

SELECT Employees.emp_name, Departments.dept_name, 
(SELECT project_name FROM projects WHERE dept_id = (SELECT dept_id FROM Employees WHERE emp_id =2)) AS project_name
FROM Employees 
INNER JOIN Departments ON Employees.dept_id = Departments.dept_id
WHERE Employees.dept_id = 101;

select Employees.dept_id, Departments.dept_name,projects.project_name 
from Employees 
inner join Departments  on Employees.dept_id = Departments.dept_id
inner join projects  on Employees.dept_id = projects.dept_id order by dept_id ;

select Employees.emp_name, Departments.dept_name, projects.project_name
from Employees 
inner join Departments  on Employees.dept_id = Departments.dept_id
inner join projects  on Employees.dept_id = projects.dept_id 
where Employees.dept_id = 102 ;

#find all employees who work in the sale department.###

#List project names along with the department names.
select projects.project_name as project_name,departments.dept_name as dept_name
from projects inner join departments  on projects.dept_id = departments.dept_id;

#Retrieve the department name for wmployees whose salary is more than 7500.
select dept_name from Employees where salary > 7500; # NOT WORK
select dept_name from Employees inner join Departments  on Employees.dept_id = Departments.dept_id where Employees.salary > 7500; 
 
#5.Find the number of employees in each department.
select Departments.dept_name, count(emp_id) as number_of_employees from Employees inner join 
Department on Employees.dept_id = Departments.dept_id group by dept_name;  # NOT WORK

#6.Get total salary  of each department.
select Departments,sum(salary) as total_salary from Employees group by Departments; # NJOT WORk
select Departments.dept_name,sum(salary) as Total_salary from departments left join Employees on Departments.dept_id=Employees.dept_id group by dept_name;
#7.Find all department that have no employees.
select dept_name,emp_name from Departments left join Employees on Departments.dept_id,Employees.dept_id where emp_name is null;
#8.List the employees names and their respective project names.

#9.Find the employees and the project name for employees in 'HR' department.

#10.Retrieve departments with more than 1 project name.