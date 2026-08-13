WITH id_dm AS (SELECT id FROM person WHERE name = 'Dmitriy') 

SELECT p.name AS pizzeria_name
FROM person_visits pv
JOIN id_dm ON pv.person_id = id_dm.id AND pv.visit_date = '2022-01-08'
JOIN pizzeria p ON p.id IN(pv.pizzeria_id)
JOIN menu m ON p.id IN(m.pizzeria_id) AND price < 800;
