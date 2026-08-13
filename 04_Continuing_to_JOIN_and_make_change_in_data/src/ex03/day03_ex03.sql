WITH f AS (SELECT * FROM person_visits pv JOIN person p ON p.id IN(pv.person_id) AND p.gender = 'female'),
m AS (SELECT * FROM person_visits pv JOIN person p ON p.id = pv.person_id AND p.gender = 'male'),
visit_f AS 
	(SELECT pizzeria.name AS name, pizzeria.id, COUNT(*) AS counter
	FROM f
	JOIN pizzeria ON pizzeria.id = f.pizzeria_id
	GROUP BY pizzeria.name, pizzeria.id ),
visit_m AS 
	(SELECT pizzeria.name AS name, pizzeria.id, COUNT(*) AS counter
	FROM m
	JOIN pizzeria ON pizzeria.id = m.pizzeria_id 
	GROUP BY pizzeria.name, pizzeria.id)


SELECT visit_m.name AS pizzeria_name
FROM visit_m
JOIN visit_f ON visit_f.name IN(visit_m.name) AND visit_m.counter > visit_f.counter
UNION ALL
SELECT visit_f.name AS pizzeria_name
FROM visit_f
JOIN visit_m ON visit_f.name = visit_m.name AND visit_f.counter > visit_m.counter
ORDER BY pizzeria_name;



