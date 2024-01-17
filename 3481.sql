--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 3481

CREATE TABLE nodes
(node_id int, pointer int);



INSERT INTO nodes
(node_id, pointer)
VALUES
(50, 30),
(50, 75),
(30, 15),
(30, 35),
(15, 1),
(15, 20),
(35, 32),
(35, 40),
(1,	null),
(20, null),
(32, null),
(40, null),
(75, 60),
(75, 90),
(60, 55),
(60, 70),
(90, 80),
(90, 95),
(55, null),
(70, null),
(80, null),
(95, null);



/*  Execute this query to drop the tables */
-- DROP TABLE nodes;


-- RESPOSTA --


SELECT DISTINCT
    node_id,
    CASE
        WHEN pointer IS NULL THEN 'LEAF'
        WHEN node_id NOT IN (SELECT DISTINCT pointer FROM nodes WHERE pointer IS NOT NULL) THEN 'ROOT'
        ELSE 'INNER'
    END AS type
FROM
    nodes

ORDER BY
    node_id;