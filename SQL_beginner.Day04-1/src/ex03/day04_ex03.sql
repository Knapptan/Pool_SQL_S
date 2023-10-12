SELECT generated_date
FROM v_generated_dates
EXCEPT
SELECT visit_date AS date
FROM person_visits
ORDER BY generated_date;