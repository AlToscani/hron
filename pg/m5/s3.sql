-- examples on update

-- the current table status
select *
from service;

-- updating a single row (if found)
update service
set name = 'K&R Associates', location_id = 1500
where service_id = 33;

-- updating all rows - by mistake?
-- ??? committing ???
update service
set name = 'mistake?';

-- updating (potentially) more rows
update service
set name = 'N/A!'
where service_id > 10;

-- check the current salary for IT people
select e.first_name, e.last_name, e.salary
from employee e join department d using (department_id)
where d.name = 'IT';

-- update - where subquery
-- assuming department name is not duplicated!
update employee
set salary = salary + 100
where manager_id = (
	select manager_id
	from department
	where name = 'IT');
