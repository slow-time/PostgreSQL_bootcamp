WITH name_d_a AS (SELECT name, id FROM person WHERE name IN('Denis', 'Anna')),
orders AS (SELECT menu_id FROM person_order JOIN name_d_a ON name_d_a.id IN(person_id))

SELECT pizza_name, pizzeria.name AS pizzeria_name 
FROM menu
JOIN orders ON id IN (orders.menu_id)
JOIN pizzeria ON pizzeria.id IN(menu.pizzeria_id)
ORDER BY 1, 2;
