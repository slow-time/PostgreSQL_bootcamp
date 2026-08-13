
WITH info_pizza AS (SELECT pizza_name, pizzeria_id, price
FROM menu
WHERE pizza_name IN('pepperoni pizza', 'mushroom pizza'))

SELECT info_pizza.pizza_name, pizzeria.name, price
FROM info_pizza
LEFT JOIN pizzeria ON pizzeria.id = info_pizza.pizzeria_id
ORDER BY info_pizza.pizza_name, pizzeria.name;