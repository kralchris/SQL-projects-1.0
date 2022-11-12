  -- Project 1.2
	-- Energy consumption
	
	-- The goal is to find the date with the highest total energy consumption of clocks in Prague.
	-- We will output the date and the total consumption across all clocks.
	
  drop table if exists prague1_energy;
  drop table if exists prague2_energy;
  drop table if exists pragueother_energy;
 
  CREATE TABLE prague1_energy (
  date date, 
  consumption int
  );

  CREATE TABLE prague2_energy (
  date date, 
  consumption int
  );

  CREATE TABLE pragueother_energy (
  date date, 
  consumption int
  );

  insert into prague1_energy values ('2019-06-01', 10);
  insert into prague1_energy values ('2019-06-02', 11);
  insert into prague1_energy values ('2019-06-03', 20);
  insert into prague1_energy values ('2019-06-04', 10);
  insert into prague1_energy values ('2019-06-05', 10);
  insert into prague1_energy values ('2019-06-06', 10);

  insert into prague2_energy values ('2019-06-01', 44);
  insert into prague2_energy values ('2019-06-02', 30);
  insert into prague2_energy values ('2019-06-03', 12);
  insert into prague2_energy values ('2019-06-04', 30);
  insert into prague2_energy values ('2019-06-05', 30);
  insert into prague2_energy values ('2019-06-06', 44);

  insert into pragueother_energy values ('2019-06-01', 29);
  insert into pragueother_energy values ('2019-06-02', 30);
  insert into pragueother_energy values ('2019-06-03', 29);
  insert into pragueother_energy values ('2019-06-04', 29);
  insert into pragueother_energy values ('2019-06-05', 29);
  insert into pragueother_energy values ('2019-06-06', 29);

-- date | highest_consumption

-- union all
-- group by date, total_consumption
-- max
-- filter max = maximum_consumption

with joined as (
(select * from prague1_energy)
union all
(select * from prague2_energy)
union all
(select * from pragueother_energy)
)
, total_consumption as (
select date,
  sum(consumption) as total_consumption
from joined
group by 1
)
select date, total_consumption
from total_consumption
where total_consumption = (select max(total_consumption) from total_consumption)
