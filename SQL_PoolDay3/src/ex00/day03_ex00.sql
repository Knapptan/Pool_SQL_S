SELECT m.pizza_name, m.price, pz.name, pv.visit_date
FROM menu m
JOIN pizzeria pz ON pz.id = m.pizzeria_id
JOIN person_visits pv ON pv.pizzeria_id = m.pizzeria_id 
JOIN person p ON pv.person_id = p.id
WHERE p.name = 'Kate' AND (m.price BETWEEN 800 AND 1000)
ORDER BY m.pizza_name, m.price, pz.name