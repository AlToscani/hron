select e.first_name, e.last_name, e.salary, d."name" 
from employee e join department d 
	using(department_id)
where d."name" ilike 'it%'
order by e.salary desc;