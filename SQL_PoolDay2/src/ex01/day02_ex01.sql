SELECT gd::DATE AS missing_date
FROM (SELECT * FROM person_visits po WHERE person_id = 1 OR person_id = 2) as pv  
RIGHT JOIN generate_series('2022-01-01', '2022-01-10', INTERVAL '1 day') AS gd 
ON pv.visit_date = gd
WHERE pv.id is null