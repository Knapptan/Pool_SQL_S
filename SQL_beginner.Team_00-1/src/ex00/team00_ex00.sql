CREATE TABLE IF NOT EXISTS nodes
(point1 varchar NOT null,
 point2 varchar NOT null,
 cost integer NOT null DEFAULT 10);
 
INSERT INTO nodes VALUES ('a', 'b', 10);
INSERT INTO nodes VALUES ('b', 'a', 10);
INSERT INTO nodes VALUES ('a', 'd', 20);
INSERT INTO nodes VALUES ('d', 'a', 20);
INSERT INTO nodes VALUES ('a', 'c', 15);
INSERT INTO nodes VALUES ('c', 'a', 15);
INSERT INTO nodes VALUES ('b', 'c', 35);
INSERT INTO nodes VALUES ('c', 'b', 35);
INSERT INTO nodes VALUES ('d', 'b', 25);
INSERT INTO nodes VALUES ('b', 'd', 25);
INSERT INTO nodes VALUES ('d', 'c', 30);
INSERT INTO nodes VALUES ('c', 'd', 30);

WITH RECURSIVE a_tours AS (
  SELECT 
	point1 AS tour, 
	point1, 
	point2, 
	cost
  FROM 
	nodes
  WHERE 
	point1 = 'a'
  UNION ALL
	SELECT 
	 parent.tour || ',' || child.point1 AS tour, 
	 child.point1, 
	 child.point2, 
	 parent.cost + child.cost AS summ 
	FROM 
	  nodes AS child
	INNER JOIN a_tours AS parent ON child.point1 = parent.point2
	WHERE tour not like '%' || child.point1 || '%'
),
f_tours AS (
	SELECT cost, concat('{', tour, ',a', '}') AS tour
	FROM a_tours 
	WHERE point2 = 'a' AND length(tour) = 7
)

SELECT
	cost AS total_cost,
	tour
FROM f_tours
WHERE cost = (SELECT MIN(cost) FROM f_tours)
ORDER BY 1, 2;
