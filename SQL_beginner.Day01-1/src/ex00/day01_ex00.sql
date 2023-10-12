SELECT id AS object_id, pizza_name as object_name
FROM menu
UNION
SELECT id AS object_id, name as object_name
FROM person
ORDER BY object_id, object_name