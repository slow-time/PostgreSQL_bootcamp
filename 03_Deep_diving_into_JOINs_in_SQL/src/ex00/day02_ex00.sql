SELECT name, rating
FROM pizzeria
WHERE NOT EXISTS (    
	SELECT 1    
	FROM person_visits    
	WHERE pizzeria_id = pizzeria.id
	);