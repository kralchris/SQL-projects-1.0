  -- Project 1.3
  -- Corporate dinner registrations (alternative: Prague Marathon)

  -- The goal is to find out how many people have unregistered
  
  -- filter by '2020-01-10'
  -- number of unregistered / unregistered + registered
  
  drop table if exists reg_status;

  CREATE TABLE reg_status (
  reg_id int, 
  date date, 
  status varchar(20) -- (registered, unregistered)
  );

  insert into reg_status values (1, '2020-01-07', 'registered');
  insert into reg_status values (2, '2020-01-07', 'registered');
  insert into reg_status values (3, '2020-01-07', 'registered');
  insert into reg_status values (4, '2020-01-07', 'registered');
  insert into reg_status values (1, '2020-01-08', 'registered');
  insert into reg_status values (2, '2020-01-08', 'unregistered');
  insert into reg_status values (3, '2020-01-08', 'registered');
  insert into reg_status values (4, '2020-01-08', 'registered');
  insert into reg_status values (1, '2020-01-09', 'registered');
  insert into reg_status values (2, '2020-01-09', 'unregistered');
  insert into reg_status values (3, '2020-01-09', 'registered');
  insert into reg_status values (4, '2020-01-09', 'unregistered');
  insert into reg_status values (1, '2020-01-10', 'registered');
  insert into reg_status values (2, '2020-01-10', 'registered');
  insert into reg_status values (3, '2020-01-10', 'registered');
  insert into reg_status values (4, '2020-01-10', 'unregistered');

-- query

select count(case when status = 'unregistered' then 1 else null end) * 1.00 /
  (count(case when status = 'unregistered' then 1 else null end) +
  count(case when status = 'registered' then 1 else null end)) * 100 percent_unregistered
from reg_status
where date = '2020-01-10'

-- Alternative version :
--
-- with unregistered as(
-- select date,
--   count(case when status = 'unregistered' then 1 else null end) * 1.00 /
--   (count(case when status = 'unregistered' then 1 else null end) +
--   count(case when status = 'registered' then 1 else null end)) * 100 percent_unregistered
-- from reg_status
-- group by 1
-- )
-- select percent_unregistered
-- from unregistered
-- where date = '2020-01-10'
