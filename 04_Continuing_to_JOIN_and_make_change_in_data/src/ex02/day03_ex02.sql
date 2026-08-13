SELECT menu.pizza_name, price, p.name AS pizzeria_name
FROM menu
JOIN pizzeria p ON p.id IN (menu.pizzeria_id)
WHERE NOT EXISTS(
SELECT *
FROM person_order po
WHERE po.menu_id IN(menu.id)
)
ORDER BY 1, 2;

