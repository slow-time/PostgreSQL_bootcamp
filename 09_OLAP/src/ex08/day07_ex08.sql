WITH count_orders AS (
SELECT p.id AS person_id, pz.id AS pizzeria_id, COUNT(p.id) AS count_id
FROM person_order po
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria pz ON pz.id = m.pizzeria_id
JOIN person p ON p.id = po.person_id
GROUP BY p.id, pz.id
)

SELECT p.address, pz.name, SUM(co.count_id) AS count_of_orders
FROM count_orders co
JOIN pizzeria pz ON pz.id = co.pizzeria_id
JOIN person p ON p.id = co.person_id
GROUP BY p.address, pz.name
ORDER BY 1 ASC, 2 ASC;

