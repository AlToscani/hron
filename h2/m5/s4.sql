-- examples on delete

-- the current table status
select *
from service;

-- delete a single row, if exists
delete from service
where service_id = 5;

-- multiline delete - be extra careful with it!
delete from service
where service_id > 3;

-- even more careful here!
-- !!! another table references some of these rows, so the operation won't succeed !!!
delete from service;
