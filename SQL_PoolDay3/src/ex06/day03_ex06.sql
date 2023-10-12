SELECT DISTINCT m1.pizza_name, pz1.name AS pizzeria_name_1, pz2.name AS pizzeria_name_2, m1.price
	FROM menu m1 
	JOIN pizzeria pz1 ON m1.pizzeria_id = pz1.id
	JOIN pizzeria pz2 ON m1.pizzeria_id != pz2.id
	JOIN menu m2 ON m1.price = m2.price AND m1.pizza_name = m2.pizza_name AND pz2.id = m2.pizzeria_id
	WHERE pz2.id < pz1.id
 ORDER BY pizza_name