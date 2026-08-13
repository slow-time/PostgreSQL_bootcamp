SELECT name, SUM(count) AS total_count
FROM 
(
(SELECT p.name AS name, COUNT(*)
FROM person_order po
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria p ON p.id = m.pizzeria_id
GROUP BY m.pizzeria_id, p.name
)

UNION ALL

(SELECT p.name AS name, COUNT(*)
FROM person_visits pv
JOIN pizzeria p ON p.id = pv.pizzeria_id
GROUP BY pv.pizzeria_id, p.name
)
)
GROUP BY name
ORDER BY 2 DESC, 1 ASC;
