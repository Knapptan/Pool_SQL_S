INSERT INTO person_visits(id, person_id, pizzeria_id, visit_date)
VALUES (
(SELECT MAX(id) + 1 FROM person_visits),
(SELECT id FROM person WHERE name = 'Dmitriy'), 
(SELECT pizzeria_id FROM menu WHERE price < 800 AND pizzeria_id <> 4 LIMIT 1),
'08.01.2022'::date);

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
