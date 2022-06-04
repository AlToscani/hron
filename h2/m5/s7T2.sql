-- examples on transaction anomalies

-- phantom read, default behavior in PostgreSQL
begin; -- (1)
	select * from service; -- (2)
	insert into service (service_id, name) values (22, 'T2 insert'); -- (3) executed by T2
commit; -- (4) executed by T2
select * from service; -- (5) T2 sees the expected result, T1 sees a phantom!
-- commit; -- (6) executed by T1

-- non-repeatable read, default behavior in PostgreSQL
begin; -- (1)
	select * from service where service_id = 22; -- (2)
	update service set name = 'T2 update' where service_id = 22; -- (3) T2 update the row
commit; -- (4) executed by T2
-- select * from service where service_id = 22; -- (5) if T1 sees a change here, it is a non-repeatable read!
-- commit; -- (6) executed by T1
select * from service where service_id = 22; -- (7) both T1 and T2 see the change

-- lost update, it won't happen in PostgreSQL
begin; -- (1)
	-- update service set name = concat(name, ' U1') where service_id = 22; -- (2) T1
	update service set name = concat(name, ' U2') where service_id = 22; -- (3) T2 expected to hang until T1 commit
commit; -- (4)
select * from service where service_id = 22; -- (5) both U1 and U2, or there has been a lost update!

-- dirty read, it will never happen in PostgreSQL
begin; -- (1)
	update service set name = 'dirty' where service_id = 22; -- (2) T2
	select * from service where service_id = 22; -- (3) if both T1 and T2 read the changed value, this is a dirty read!
rollback; -- (4)
select * from service where service_id = 22; -- (5) back to previous value
