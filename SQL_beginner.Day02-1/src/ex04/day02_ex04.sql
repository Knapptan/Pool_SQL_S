SELECT pizza_name, p.name AS pizzeria_name, price
FROM menu
JOIN pizzeria p ON p.id = menu.pizzeria_id
WHERE pizza_name = 'mushroom pizza' OR pizza_name = 'pepperoni pizza'
ORDER BY pizza_name, pizzeria_name