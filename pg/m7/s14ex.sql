-- create, execute, and finally drop a procedure
--
-- get_avg_salary()
--    param in: job_id
--    param out: avg salary for employees with the given job_id


create or replace procedure get_avg_salary(
	p_job_id in employee.job_id%type,
	p_avg_salary out employee.salary%type)
language plpgsql as $$
BEGIN
	SELECT avg(salary)
	INTO p_avg_salary FROM employee
	where job_id = p_job_id;
end $$;


do $$
declare 
	v_job_id int; 
	v_avg_salary numeric;
begin
	v_job_id := 14;
	call get_avg_salary(v_job_id, v_avg_salary);
	raise notice 'the average salary for job_id % is %', v_job_id, v_avg_salary;
end $$;
