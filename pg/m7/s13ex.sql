-- create, execute, and finally drop a function
--
-- get_higher_salary()
--    param in: manager_id
--    return: higher salary for an employee having the specified manager in hron.employee

create or replace function get_higher_salary(
	p_manager_id in employee.manager_id%type)
returns employee.salary%type
language plpgsql as $$
declare
    v_higher_salary employee.salary%type;
begin
   select max(salary)
   into v_higher_salary from employee
--   group by manager_id 
   where manager_id = p_manager_id;
--   order by salary desc
--   limit 1;
   return v_higher_salary;
end $$;

select get_higher_salary(100);

drop function if exists get_higher_salary;