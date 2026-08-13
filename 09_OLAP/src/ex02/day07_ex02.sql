SELECT *
FROM 
(SELECT p.name AS name, COUNT(*), 'order' AS action_type
FROM person_order po
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria p ON p.id = m.pizzeria_id
GROUP BY m.pizzeria_id, p.name
ORDER BY 2 DESC
LIMIT 3)

UNION

(SELECT p.name AS name, COUNT(*), 'visit' AS action_type
FROM person_visits pv
JOIN pizzeria p ON p.id = pv.pizzeria_id
GROUP BY pv.pizzeria_id, p.name
ORDER BY 2 DESC
LIMIT 3)
ORDER BY 3 ASC, 2 DESC;

