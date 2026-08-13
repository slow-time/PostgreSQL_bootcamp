WITH names_f AS (SELECT name, id FROM person WHERE gender = 'female'), 
person_id_p_c AS (
SELECT po.person_id
FROM person_order po
JOIN menu ON pizza_name = 'pepperoni pizza' AND menu.id IN(po.menu_id)
INTERSECT
SELECT po.person_id
FROM person_order po
JOIN menu ON pizza_name = 'cheese pizza' AND menu.id IN(po.menu_id)
)

SELECT DISTINCT n.name
FROM names_f n
JOIN person_order po ON n.id IN(po.person_id)
JOIN person_id_p_c ON person_id_p_c.person_id IN(po.menu_id) 
ORDER BY n.name;