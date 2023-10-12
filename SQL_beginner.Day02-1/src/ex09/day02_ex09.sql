SELECT p.name
FROM person p
JOIN person_order po ON po.person_id = p.id
JOIN menu m ON m.id = po.menu_id
WHERE p.gender = 'female' AND m.pizza_name = 'cheese pizza'
INTERSECT
SELECT p.name
FROM person p
JOIN person_order po ON po.person_id = p.id
JOIN menu m ON m.id = po.menu_id
WHERE p.gender = 'female' AND  m.pizza_name = 'pepperoni pizza'
ORDER BY name 
