
  -- Project 1.5
  -- The W.A.C.O. (short for ''World Anti-Corruption Office'') has its headquarters in Prague, Czech republic. Let's find out what the top 3 unique salaries for each department are
  -- along with the rank.  
  -- Note : Data and names in this project are fictional.
  
  -- department | salary | rank ID
  -- dense_rank by dpt., order by salary desc.
  -- rank ID <= 3
  -- unique
  
  
  drop table if exists waco_employee;

CREATE TABLE waco_employee (
    id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    sex VARCHAR(10),
    employee_title VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    target INT,
    bonus INT,
    email VARCHAR(50),
    city VARCHAR(20),
    address VARCHAR(100),
    manager_id INT
);

  insert into waco_employee values (1, 'Jacob', 'Smith', 28, 'male', 'software engineer', 'tech', 80000, 82000, 10000, 
    'jacobsmith@waco.com','Brno metropolitan area', NULL, 2);
  insert into waco_employee values (2, 'Sally', 'White', 33, 'female', 'software engineer manager', 'tech', 110000, 120000, 15000, 
    'sallywhite@waco.com','Prague', NULL, 4);
  insert into waco_employee values (3, 'Arvind', 'Agarwal', 45, 'male', 'software engineer', 'tech', 400000, 420000, 50000, 
    NULL,'', NULL, 2);
  insert into waco_employee values (4, 'Lisa', 'Kim', 28, NULL, 'data scientist', 'tech', 70000, 790000, 12000, 
    NULL,'Pilsen', NULL, 2);


  insert into waco_employee values (5, 'Ajay', 'Khan', 19, NULL, 'product manager intern', 'product', 40000, 40000, NULL, 
    NULL,'J Hradec', NULL, NULL);
  insert into waco_employee values (6, 'Walter', 'White', 25, NULL, 'project manager', 'product', 100000, 100000, NULL, 
    NULL,'Prague', NULL, NULL);
  insert into waco_employee values (7, 'Paris', 'Green', 25, NULL, 'product manager', 'product', 100000, 100000, NULL, 
    NULL,'Prague', NULL, NULL);
  insert into waco_employee values (12, 'Kyle', 'Kyle', 50, NULL, 'product manager', 'product', 1200000, 1200000, NULL, 
    NULL,'Brno metropolitan area', NULL, NULL);



  insert into waco_employee values (8, 'Kelly', 'James', 19, NULL, NULL, 'hr', 40000, 40000, 20000, 
    NULL,NULL, NULL, NULL);
  insert into waco_employee values (9, 'Susan', 'Lee', 43, 'female', NULL, 'hr', 60000, 60000, 20000, 
    NULL,NULL, NULL, NULL);
  insert into waco_employee values (10, 'Jonas', 'Kwan', 25, 'male', NULL, 'hr', 60000, 60000, 20000, 
    NULL,NULL, NULL, NULL);
  insert into waco_employee values (11, 'Amanda', 'Lee', 40, 'non-binary', 'hr lead', 'hr', 300000, 300000, 30000, 
    NULL,NULL, NULL, NULL);

insert into waco_employee values (13, 'Beepbeep', 'Boop', 1, 'male', 'cat', 'entertainment', NULL, NULL, NULL, 
    NULL,'Ostrava', NULL, NULL);
  insert into waco_employee values (14, 'Boop', 'Beepbeep', 1, 'female', 'cat', 'entertainment', NULL, NULL, NULL, 
    NULL,'Ostrava', NULL, NULL);

-- query

with ranked as 
(select department, salary,
dense_rank() over (partition by department order by salary desc) as rank_id
from waco_employee
)
select distinct department, salary, rank_id
from ranked
where rank_id <= 3
order by department, salary desc
