SELECT address, formula, average, 
CASE 
	WHEN formula > average THEN true
	ELSE false
END AS comparison

FROM (SELECT address, 
ROUND(MAX(age)::NUMERIC - (MIN(age)::NUMERIC / MAX(age)::NUMERIC), 2)::REAL AS formula, 
ROUND(AVG(age::NUMERIC), 2)::REAL AS average
FROM person
GROUP BY address
ORDER BY 1);

