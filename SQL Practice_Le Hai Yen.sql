---1---
select last_name, hire_date, department_id from employees
where department_id in (select department_id from employees where last_name ='Zlotkey')
and last_name <> 'Zlotkey'

---2---
select employee_id, last_name, salary from employees
where salary > (select avg(salary) from employees)
order by salary asc

---3---
select employee_id, last_name, department_id from employees
where department_id in (select department_id from employees where last_name like '%u%')

---4---
select e.last_name, d.department_id, e.job_id
from employees e
inner join departments d on d.department_id = e.department_id
where d.location_id = 1700

---5---
--5.1--
select last_name, salary from employees
where manager_id in 
(select employee_id from employees where last_name = 'King')

--5.2--
select e.last_name, e.salary from employees e
join employees manager on e.manager_id = manager.employee_id
where manager.last_name = 'King' 

---6---
select e.last_name, d.department_id, e.job_id
from departments d
inner join employees e on e.department_id = d.department_id
where department_name = 'Executive'

---7---
select e.employee_id, e.last_name, e.salary, d.department_id, d.department_name 
from employees e
inner join departments d on e.department_id = d.department_id
where salary > (select avg(salary) from employees)
and last_name like '%u%'

---8---
select round(max(salary), 0) as Maximum, round(min(salary), 0) as Minimum, round(sum(salary), 0) as Sum, round(avg(salary), 0) as Average
from employees

---9---
select upper(left(last_name,1))+lower(substring(last_name,2,len(last_name))) as "Last name",
len(last_name) as "Length name"
FROM employees
where last_name like 'J%' 
or last_name like 'A%' 
or last_name like'M%'
order by last_name

---10---
select employee_id, last_name, salary, round(1.155*salary, 0) as "New Salary"
from employees

---11---
select e.last_name, e.department_id, d.department_name
from employees e full join departments d on e.department_id = d.department_id

---12---
select e.employee_id
from employees e
join employees manager
on e.manager_id = manager.employee_id
where e.hire_date > manager.hire_date
and e.department_id in (select department_id from departments 
where location_id in (select location_id from locations where city = 'Toronto'))