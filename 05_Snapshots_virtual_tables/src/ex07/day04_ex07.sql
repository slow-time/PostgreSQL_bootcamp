INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES (
(SELECT MAX(id) + 1 FROM person_visits), 
(SELECT id FROM person WHERE name = 'Dmitriy'), 
(SELECT p.id FROM pizzeria p 
	JOIN menu ON menu.pizzeria_id = p.id AND p.name <> 'Papa Johns' AND menu.price < 800
	LIMIT 1),
'2022-01-08'
);

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;


