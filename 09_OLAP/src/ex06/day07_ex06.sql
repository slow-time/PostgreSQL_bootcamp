SELECT p.name, COUNT(p.name) AS count_of_orders, (ROUND(AVG(price), 2))::REAL AS average_price, MAX(m.price) AS max_price, MIN(m.price) AS min_price
FROM pizzeria p 
JOIN menu m ON m.pizzeria_id = p.id
JOIN person_order po ON po.menu_id = m.id
GROUP BY p.name, p.id
ORDER BY 1;