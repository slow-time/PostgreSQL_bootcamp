SELECT object_name AS object_name FROM 
	(SELECT name as object_name FROM person ORDER BY object_name)
UNION ALL
SELECT object_name AS object_name FROM 
	(SELECT pizza_name as object_name FROM menu ORDER BY object_name);