WITH names_ms AS (SELECT name, id FROM person WHERE address IN ('Moscow', 'Samara') AND gender = 'male') 

SELECT names_ms.name
FROM person_order po
JOIN names_ms ON po.person_id IN(names_ms.id)
JOIN menu ON po.menu_id IN(menu.id) AND menu.pizza_name IN('mushroom pizza', 'pepperoni pizza')
ORDER BY names_ms.name DESC;
