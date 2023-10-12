SELECT p.address,
	ROUND(MAX(p.age)-(MIN(p.age)/MAX(p.age)::numeric), 2) AS formula,
	ROUND(AVG(p.age), 2) AS average,
	ROUND(MAX(p.age)-(MIN(p.age)/MAX(p.age)::numeric), 2)> ROUND(AVG(p.age), 2) AS comparison
FROM person p
GROUP BY address
ORDER BY address
