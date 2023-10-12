SELECT  p.name AS name, 
		m.pizza_name, 
		m.price, 
		(m.price - (m.price * pd.discount/100)) AS discount_price,
		pz.name AS pizzeria_name
FROM person_discounts pd
JOIN person p ON p.id = pd.person_id
JOIN menu m ON m.pizzeria_id = pd.pizzeria_id
JOIN pizzeria pz ON pz.id = m.pizzeria_id
ORDER BY 1, 2


