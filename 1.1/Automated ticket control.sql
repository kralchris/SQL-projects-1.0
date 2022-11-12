      -- Project 1.1
	-- Automated ticket control in the Prague metro
	
	-- The goal is to calculate the rate of the people who exited the metro
	-- exite_rate by date
	-- date | exit_rate = number of exits / number of enters
	
	-- group by date
	-- count number of exits / count number of enters
	
  drop table if exists prague_metro;

  CREATE TABLE prague_metro (
  commuter_id integer, 
  created_at date, 
  event_name varchar(50) -- (enter, exit, noexit)
  );

  insert into prague_metro values (1, '2020-06-01', 'enter');
  insert into prague_metro values (1, '2020-06-01', 'noexit');
  insert into prague_metro values (2, '2020-06-01', 'enter');
  insert into prague_metro values (2, '2020-06-01', 'exit');
  insert into prague_metro values (2, '2020-06-01', 'enter');
  insert into prague_metro values (2, '2020-06-01', 'exit');
  insert into prague_metro values (1, '2020-06-02', 'enter');
  insert into prague_metro values (1, '2020-06-02', 'exit');
  insert into prague_metro values (3, '2020-06-02', 'enter');
  insert into prague_metro values (3, '2020-06-02', 'noexit');
  insert into prague_metro values (1, '2020-06-03', 'enter');
  insert into prague_metro values (1, '2020-06-03', 'exit');
  insert into prague_metro values (3, '2020-06-03', 'enter');
  insert into prague_metro values (3, '2020-06-03', 'exit');
  
  -- queries
with created_events as (
select created_at,
    count(case when event_name = 'exit' then 1 else null end) * 1.00 /
    count(case when event_name = 'enter' then 1 else null end) * 100 as percent_exits
  from prague_metro
  group by created_at
  order by created_at
)
-- exit rates by day ?
-- which day of the week has the lowest exit rate ?

-- group by extracted dow (day of week)
-- average exits
-- day | percent_exits
-- min percent_exits
-- order by percent_exits asc
-- top

select extract(dow from created_at) as dow,
  avg(percent_exits)
from prague_metro
group by 1
group by 2 asc
)
  -- alternative
  --
select extract(dow from created_at) as dow,
    count(case when event_name = 'exit' then 1 else null end) * 1.00 /
    count(case when event_name = 'enter' then 1 else null end) * 100 as percent_exits  
from prague_metro
group by 1
group by 2 asc
