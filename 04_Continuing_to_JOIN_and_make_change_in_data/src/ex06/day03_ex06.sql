WITH all_price AS (SELECT pizza_name, price, p.name 
FROM menu
JOIN pizzeria p ON p.id = menu.pizzeria_id
ORDER BY pizza_name)

SELECT p1.pizza_name, p1.name AS pizzeria_name_1, p2.name AS pizzeria_name_2, p1.price
FROM all_price p1
JOIN all_price p2 ON p1.price = p2.price AND p1.name <> p2.name AND p1.pizza_name = p2.pizza_name AND p1.name < p2.name
ORDER BY 1;



