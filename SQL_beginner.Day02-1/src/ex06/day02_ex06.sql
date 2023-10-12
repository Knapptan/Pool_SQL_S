SELECT m.pizza_name, pz.name AS pizzeria_name
FROM person_order po
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria pz ON pz.id = m.pizzeria_id
JOIN person p ON po.person_id = p.id 
WHERE p.name = 'Denis' or p.name = 'Anna'
ORDER BY pizza_name, pizzeria_name