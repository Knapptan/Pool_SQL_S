WITH visits_orders AS ((SELECT pz.name, COUNT(*) AS count, 'order' AS action_type
FROM person_order po
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria pz ON m.pizzeria_id = pz.id
GROUP BY pz.name
ORDER BY count DESC)
UNION
(SELECT pz.name, COUNT(*) AS count, 'visit' AS action_type
FROM person_visits pv
JOIN pizzeria pz ON pv.pizzeria_id = pz.id
GROUP BY pz.name
ORDER BY count DESC)
ORDER BY action_type, count DESC)

SELECT name, SUM(count) AS total_count
FROM visits_orders
GROUP BY name
ORDER BY total_count DESC, name