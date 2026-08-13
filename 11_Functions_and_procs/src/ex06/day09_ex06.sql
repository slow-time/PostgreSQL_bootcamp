CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
pperson VARCHAR DEFAULT 'Dmitriy', 
pprice INTEGER DEFAULT 500, 
pdate DATE DEFAULT '2022-01-08')
RETURNS TABLE (pizzeria_name varchar) AS 
$$
BEGIN
RETURN QUERY
SELECT DISTINCT p.name
FROM person_visits pv
JOIN pizzeria p ON p.id = pv.pizzeria_id
JOIN person per ON per.id = pv.person_id
JOIN menu m ON m.pizzeria_id = p.id
WHERE per.name = pperson AND m.price < pprice AND pv.visit_date = pdate;
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');

