show search_path;
SET search_path TO hr, public;
ALTER ROLE postgres SET search_path TO hr, public;


-- find the highest salaried employee
select *
from employees 
where salary = (select max(salary) from employees);

-- find the lowered salaried employee
select *
from employees 
where salary = (select min(salary) from employees);

-- find both the highest and lowerest salaried employee
select *
from employees 
where salary = (select max(salary) from employees)
union
select *
from employees 
where salary = (select min(salary) from employees);

select *
from employees
where salary = (select max(salary) from employees)
or salary = (select min(salary) from employees);

-- find the avg salary of the organization
select avg(salary)
from employees;

-- find employees whose salary is greater than the avg salary of the organization
select *
from employees
where salary > (select avg(salary)
from employees);

-- find the distinct department_id in the employees table
select distinct(department_id)
from employees;

select count(distinct department_id)
from employees;

-- display the full name = first_name + last_name
select first_name || ' ' || last_name
from employees;  -- If last_name is NULL, the whole result is NULL. In PostgreSQL, joining anything to NULL with || gives NULL.

-- join the employees table with the department table
select e.employee_id,
e.first_name || ' ' || e.last_name as full_name,
d.department_name
from employees e
join departments d
on e.department_id = d.department_id;

-- find the manager of all the employee
select 
 e.employee_id,
 e.first_name,
 m.employee_id,
 m.first_name
from employees e
join employees m
on e.manager_id = m.employee_id;

-- Q1. Second highest salary
-- Find the second highest distinct salary in the company. Then extend it to return the employees who earn it.
select distinct salary
from employees 
where salary is not null
order by salary desc
offset 1 limit 1; -- returns the second highest salary number and not the employee detail(s)

select *
from employees 
where salary = (
 select max(salary)
 from employees 
 where salary < (select max(salary) from employees)
);

-- List employees who earn more than the average salary of their own department. Show employee name, department name, salary and the department average.
select *
from employees e
where salary > (
 select avg(salary)
 from employees
 where e.department_id = department_id
);

select 
 e.first_name,
 d.department_name,
 e.salary,
 round(da.dept_avg_sal, 2) as dept_avg
from employees e
join departments d
on e.department_id = d.department_id
join (
 select department_id, avg(salary) as dept_avg_sal
 from employees
 group by department_id
) da 
on da.department_id = e.department_id
where e.salary > dept_avg_sal;


-- Manager hierarchy: For each employee, show their name and their manager's name. Include employees with no manager, such as the CEO.

-- Departments with no employees: List every department that has no employees, along with its city and country name.
