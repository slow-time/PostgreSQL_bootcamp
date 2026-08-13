WITH visits AS (SELECT pizzeria.name AS pizzeria_name
	FROM person_visits pv
	JOIN person p ON p.id = pv.person_id AND p.name = 'Andrey'
	JOIN pizzeria ON pv.pizzeria_id = pizzeria.id), 
orders AS (SELECT pizzeria.name AS pizzeria_name
	FROM person_order po
	JOIN person p ON p.id = po.person_id AND p.name = 'Andrey'
	JOIN menu ON menu.id = po.menu_id
	JOIN pizzeria ON menu.pizzeria_id = pizzeria.id)

SELECT *
FROM visits
EXCEPT 
SELECT *
FROM orders
ORDER BY 1;


