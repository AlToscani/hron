-- examples on comparison operators

-- that one
select *
from region
where region_id = 1;

select *
from region
where name = 'Asia';

-- the other ones
select *
from region
where region_id != 2;

-- the other ones, alternative notation
select *
from region
where region_id <> 2;

-- strictly less than
select *
from region
where region_id < 3;

select *
from region
where name <= 'Asia';

-- less or equal to
select *
from region
where region_id <= 3;

-- simple pattern matching
select first_name, last_name
from employee
where last_name like '_ull%';

select first_name, last_name
from employee
where last_name like 'B%';

-- case insensitive pattern matching
select first_name, last_name
from employee
where last_name ilike 'b%';

select first_name, last_name
from employee
where last_name like '__ll%';

select first_name, last_name
from employee
where last_name like '%ull_';

select last_name
from employee
where last_name like '___';

select last_name
from employee
where last_name ilike 'sul%';

-- interval check by BETWEEN
select *
from region
where region_id between 1 and 3;

select *
from country
where name between 'A' and 'China';

select *
from country
where name >= 'A' and name <= 'China';

select *
from country
where name between 'C' and 'China';

-- check if (not) in a set by operator IN
select *
from region
where region_id not in (2, 4);

select *
from region
where region_id in (4, 2);

-- case sensitive!
select *
from region
where name in ('Europe', 'asia');

-- beware of null
select *
from region
where region_id not in (2, 3, null );

select *
from region
where name not in ('Europe', null);

-- can't compare a 'good' value with null
select *
from region
where region_id not in (null) or region_id in (null);

select *
from region
where region_id is not null or region_id is null;

-- this works fine
select *
from employee
where commission in (0.10, 0.15);

-- this does not select anything!
select *
from employee
where commission in (null);

-- "is null" is the only way to check it
select *
from employee
where commission is null;
