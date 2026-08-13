
SELECT p.name AS name, pv.count_of_visits
FROM (
SELECT person_id, COUNT(*) AS count_of_visits
FROM person_visits
GROUP BY person_id
ORDER BY 2 DESC
LIMIT 4) AS pv
JOIN person p ON p.id = pv.person_id
ORDER BY 2 DESC, 1 ASC;



