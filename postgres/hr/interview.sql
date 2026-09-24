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


