SELECT visit_date AS missing_date
FROM person_visits
EXCEPT
SELECT visit_date AS missing_date
FROM person_visits
WHERE person_id IN(1, 2)
ORDER BY missing_date;