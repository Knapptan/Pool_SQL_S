SELECT pz.name AS pizzeria_name
	FROM person p
	JOIN person_visits pv ON pv.person_id = p.id
	JOIN pizzeria pz ON pz.id = pv.pizzeria_id
	WHERE p.name = 'Andrey' 
EXCEPT
SELECT pz.name AS pizzeria_name
    FROM person p
    JOIN person_order po ON p.id = po.person_id
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
WHERE p.name = 'Andrey'
ORDER BY pizzeria_name