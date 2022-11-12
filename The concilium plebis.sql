-- Project 1.6
-- Panellists at the summit

-- The goal is to find out the level of participation of panellists at the Prague European Summit.
-- What is the distribution of comments by the count of panellists that participated between 2018 and 2020 ?
-- I should include the number of comments and the number of panellists that made the corresponding comment.


drop table if exists panellists;
drop table if exists comments;

  CREATE TABLE panellists (
  id int,
  name varchar(50),
  joined_at date,
  city_id int,
  device int
  );

  CREATE TABLE comments (
  panellist_id int,
  body varchar(500),
  created_at date
  );

  insert into panellists values (1, 'Bob Smith', '2018-01-23', 12, 9421);
  insert into panellists values (2, 'Ashley Sparks', '2019-01-01', 12, 9422);
  insert into panellists values (3, 'Donald Rump', '2020-01-14', 11, 9421);
  insert into panellists values (4, 'Jacob Smith', '2018-08-31', 31, 9423);
  insert into panellists values (5, 'Amanda Leon', '2018-04-18', 31, 9424);
  insert into panellists values (6, 'Robert Little', '2018-07-23', 12, 9425);
  insert into panellists values (7, 'Robert Big', '2020-01-31', 12, 9426);
  insert into panellists values (8, 'Stuart Little', '2017-05-17', 11, 1356);
  insert into panellists values (9, 'Samantha Junior', '2018-01-23', 12, 3421);
  insert into panellists values (10, 'Kyle Curry', '2018-01-23', 12, 6537);
  insert into panellists values (11, 'Jay Kim', '2018-01-21', 12, 2952);
  insert into panellists values (12, 'Allen Barbara', '2018-11-25', 12, 6859);
  insert into panellists values (13, 'Kelley Patel', '2011-01-01', 11, 5909);
  insert into panellists values (14, 'Danielle Kaur', '2019-12-23', 12, 4950);


  insert into comments values (1, 'I love cats', '2020-01-23');
  insert into comments values (1, 'and dogs!', '2020-01-23');
  insert into comments values (1, 'because there is meaning', '2020-01-23');
  insert into comments values (7, 'cats are alright', '2020-01-18');
  insert into comments values (7, 'no cats are great', '2020-01-05');
  insert into comments values (12, 'I like papayas', '2020-01-21');
  insert into comments values (12, 'no', '2020-01-31');
  insert into comments values (12, 'im being nice', '2020-01-05');
  insert into comments values (4, 'no go away', '2020-01-05');
  insert into comments values (11, 'good', '2020-01-05');
  insert into comments values (11, 'jolly good', '2020-05-05');
  insert into comments values (11, 'cauliflower rice', '2020-11-05');
  insert into comments values (5, 'data science is great!', '2020-01-11');
  insert into comments values (11, 'yeah its alright', '2020-01-11');

-- panellists
-- id
-- name
-- joined_at
-- city_id
-- device

-- comments
-- panellist_id
-- body
-- created_at

--
--

-- num_comments | num_panellists

-- join
-- filter created_at
-- filter joined
-- join_date < created_at
-- user, count(comments)
-- group by count(comments)
-- count(panellists)
-- order by num_comments asc

-- query

with counts as (
select panellist_id, count(body) as num_comments
from panellists a
join comments b
	on a.id = b.panellist_id
where created_at between cast('2020-01-01' as date) and cast ('2020-01-31' as date)
and joined_at between cast('2018-01-01' as date) and cast ('2020-01-31' as date)
and joined_at < created_at
group by 1
)
select num_comments, count(panellist_id) as num_panellists
from counts
group by 1
order by 1
