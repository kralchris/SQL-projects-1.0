-- Project 1.7
-- Digital Farmers' market SAPA
-- Digitální farmářské trhy SAPA

-- An employee overheard a conversation from insiders while shopping at Digitální farmářské trhy SAPA.
-- All he could hear was a vague sentence : ''This month is the same as last year!''. Could it mean that the revenues did not change ?

-- year-to-year and month-to-month


drop table if exists transactions;

CREATE TABLE transactions (
    id INT,
    created_at DATE,
    value INT,
    purchase_id INT
);

  insert into transactions values (1, '2022-01-23', 10, 100);
  insert into transactions values (1, '2022-01-23', 99, 101);
  insert into transactions values (1, '2022-02-23', 242, 102);
  insert into transactions values (1, '2022-02-23', 135, 103);
  insert into transactions values (1, '2022-02-23', 234, 104);
  insert into transactions values (1, '2022-03-23', 3453, 105);
  insert into transactions values (1, '2022-04-23', 112, 106);
  insert into transactions values (1, '2022-04-23', 1453, 107);
  insert into transactions values (1, '2022-05-23', 4564, 108);

-- query

SELECT date_trunc('month', created at) AS month,
	ROUND((SUM(value) - LAG(SUM(value), 1) OVER (ORDER BY date_trunc('month', created_at))) / LAG(SUM(value), 1) OVER
		(ORDER BY date_trunc('month', created_at)) * 100, 2) AS perc_diff
FROM transactions.transactions
GROUP BY 1
ORDER BY 1 ASC
