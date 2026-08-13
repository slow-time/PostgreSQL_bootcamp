WITH f AS (SELECT pizzeria.name AS pizzeria_name  
	FROM person p 
	JOIN person_order po ON p.id IN(po.person_id) AND p.gender = 'female'
	JOIN menu ON menu.id = po.menu_id
	JOIN pizzeria ON pizzeria.id  = menu.pizzeria_id),
m AS (SELECT pizzeria.name AS pizzeria_name  
	FROM person p 
	JOIN person_order po ON p.id IN(po.person_id) AND p.gender = 'male'
	JOIN menu ON menu.id = po.menu_id
	JOIN pizzeria ON pizzeria.id = menu.pizzeria_id)

(SELECT *
FROM f
EXCEPT
SELECT *
FROM m)
UNION
(SELECT *
FROM m
EXCEPT
SELECT *
FROM f);



