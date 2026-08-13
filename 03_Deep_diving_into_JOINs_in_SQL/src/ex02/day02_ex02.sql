WITH visits AS (SELECT person_id, pizzeria_id, visit_date
FROM person_visits
WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03'),
p_name AS (SELECT DISTINCT pizzeria.name AS pizzeria_name, visits.visit_date, id
FROM pizzeria 
FULL OUTER JOIN visits ON pizzeria.id = visits.pizzeria_id)

SELECT DISTINCT COALESCE(person.name, '-') AS person_name, visits.visit_date, COALESCE(p_name.pizzeria_name, '-') AS pizzeria_name
FROM person
FULL OUTER JOIN visits ON person.id = visits.person_id
FULL OUTER JOIN p_name ON p_name.id = visits.pizzeria_id
ORDER BY person_name, visits.visit_date, pizzeria_name;