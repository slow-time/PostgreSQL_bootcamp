SELECT order_date, p.person_information
FROM person_order 
NATURAL JOIN 
	(SELECT name || ' (age: ' || age || ')' as person_information, id AS person_id 
	FROM person
	) AS p 
ORDER BY order_date, p.person_information;
