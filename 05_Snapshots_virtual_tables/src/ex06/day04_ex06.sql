CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS 
SELECT p.name AS pizzeria_name
FROM person_visits pv
JOIN (SELECT id FROM person WHERE name = 'Dmitriy') AS id_dm ON pv.person_id = id_dm.id AND pv.visit_date = '2022-01-08'
JOIN pizzeria p ON p.id = pv.pizzeria_id
JOIN menu m ON p.id = m.pizzeria_id AND price < 800;