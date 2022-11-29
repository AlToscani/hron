-- es 1 pagina 10 postgres 1
select first_name, last_name, phone, hired
from employee
order by last_name, first_name;

select first_name, last_name, phone, hired
from employee
where first_name in ('David', 'Peter')
--where first_name = 'David' or first_name = 'Peter'
order by first_name, last_name;

select first_name, last_name, phone, hired, department_id 
from employee
--where department_id = 6
where department_id in (3,5)
order by hired;

select first_name, last_name, phone, hired, salary 
from employee
where salary > 10000
order by salary desc;

select first_name, last_name, phone, hired, salary, department_id 
from employee
where salary not between 4001 and 15001 and department_id in (8,5)
--where salary <4000 or salary >15000
order by salary desc;

select first_name, last_name, phone, hired
from employee
--where hired between '2015-01-01' and '2015-12-31'  
where hired::varchar like '2015%'
order by hired;

select distinct job_id 
from employee
order by job_id;

select first_name, last_name, commission 
from employee
where commission is not null
order by commission desc, first_name;

select first_name, last_name
from employee
where first_name like '%a%' or last_name like '%a%'
order by first_name, last_name;

select "name"
from department
order by department_id ;

select street_address ||' '|| city, country_id 
from "location"
where country_id = 'IT';

select e.first_name, d."name" , department_id
from employee e join department d 
	using (department_id);

select e.first_name, j.title 
from employee e join job j  
	using (job_id);

select *
from department
where manager_id is null;

select d."name", e.first_name, e.last_name 
from department d left outer join employee e 
on d.manager_id = e.employee_id 

select e.first_name, e.last_name, l.city 
from employee e join department d using (department_id)
	join "location" l using (location_id)
where l.country_id = 'UK';

select (e.first_name || ' ' || e.last_name) as "Employee", (e2.first_name || ' ' || e2.last_name) as "Manager"
from employee e join employee e2 
on e.manager_id = e2.employee_id ;

select e.first_name, e.last_name, e.salary as "Current Salary", e.salary * 1.085 as "New salary", e.salary * 0.085 as "Delta"
from employee e 

select e.first_name, e.last_name, e.hired, current_timestamp - e.hired as "Anzianità"
from employee e 
order by "Anzianità" desc;

select e.first_name, e.last_name , coalesce (e.commission::varchar, 'No value')
from employee e;

select max(salary), min(salary), round(avg(salary), 2) as "average"
from employee e 

select j.title , max(salary), min(salary), round(avg(salary), 2) as "average"
from employee e join job j using (job_id)
group by j.title 
order by j.title;

select j.title, count(*) 
from employee e join job j using (job_id)
group by j.title
order by j.title ;

select j.title, count(*) 
from employee e join job j using (job_id)
where j.title ='Programmer'
group by j.title ;

select count(distinct manager_id)
from employee e;

select e.first_name, e.last_name 
from employee e
where e.employee_id not in(
	select distinct e2.manager_id
	from employee e2
	where e2.manager_id is not null
);




select e.first_name, e.last_name, d."name" , l.city 
from employee e join department d using (department_id)
	join "location" l using(location_id)
where l.city ='Toronto'
order by d."name" ;

select e.first_name, e.last_name , e.hired
from employee e 
where e.hired > (
	select e2.hired
	from employee e2 
	where e2.first_name ='David' and e2.last_name ='Lee'
)
order by hired;

select *
from "location" l 
where city in ('Oxford', 'Utrecht');

begin;
insert into service (name, location_id) values ('Trasporti', (
	select location_id
	from "location"
	where city = 'Utrecht')
	);
select * from service s;
rollback;































