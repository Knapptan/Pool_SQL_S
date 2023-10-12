SELECT pz.name
FROM person_visits pv
	JOIN person p ON p.id = pv.person_id
	JOIN pizzeria pz ON pz.id = pv.pizzeria_id
	JOIN menu m ON m.pizzeria_id = pz.id
WHERE pv.visit_date = '2022-01-08' AND p.name = 'Dmitriy' AND m.price < 800
