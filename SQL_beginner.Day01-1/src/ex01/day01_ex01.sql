SELECT pizza_name as object_name
FROM menu
UNION ALL
SELECT name as object_name
FROM person
ORDER BY object_name