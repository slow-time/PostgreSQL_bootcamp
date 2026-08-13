WITH k AS (SELECT id FROM person WHERE name = 'Kate'),
pv AS (SELECT pizzeria_id, visit_date FROM person_visits JOIN k ON k.id IN(person_id)),
p AS (SELECT name, id FROM pizzeria JOIN pv ON pv.pizzeria_id IN(id))

SELECT pizza_name, price, p.name AS pizzeria_name, pv.visit_date
FROM menu
JOIN p ON p.id IN(menu.pizzeria_id) AND price BETWEEN 800 AND 1000
JOIN pv ON pv.pizzeria_id IN(menu.pizzeria_id)
ORDER BY 1, 2, 3;


