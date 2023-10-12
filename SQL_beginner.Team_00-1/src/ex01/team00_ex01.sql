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
WHERE
    cost = (SELECT MIN(cost) FROM f_tours)
    OR
    cost = (SELECT MAX(cost) FROM f_tours)
ORDER BY 1, 2;
