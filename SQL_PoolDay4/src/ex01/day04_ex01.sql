SELECT name AS name 
FROM v_persons_female 
UNION
SELECT name AS name
FROM v_persons_male 
ORDER BY name