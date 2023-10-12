(SELECT pz.name AS pizzeria_name
	FROM person p
	JOIN person_order po ON po.person_id = p.id
	JOIN menu m ON m.id = po.menu_id
	JOIN pizzeria pz ON pz.id = m.pizzeria_id
	WHERE p.gender = 'female' 
	EXCEPT
SELECT pz.name AS pizzeria_name
	FROM person p
	JOIN person_order po ON po.person_id = p.id
	JOIN menu m ON m.id = po.menu_id
	JOIN pizzeria pz ON pz.id = m.pizzeria_id
	WHERE p.gender = 'male' )
	UNION
(SELECT pz.name AS pizzeria_name
	FROM person p
	JOIN person_order po ON po.person_id = p.id
	JOIN menu m ON m.id = po.menu_id
	JOIN pizzeria pz ON pz.id = m.pizzeria_id
	WHERE p.gender = 'male' 
	EXCEPT
SELECT pz.name AS pizzeria_name
	FROM person p
	JOIN person_order po ON po.person_id = p.id
	JOIN menu m ON m.id = po.menu_id
	JOIN pizzeria pz ON pz.id = m.pizzeria_id
	WHERE p.gender = 'female')
ORDER BY pizzeria_name
