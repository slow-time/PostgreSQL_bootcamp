WITH all_dates AS (SELECT generate_series('2022-01-01', '2022-01-10', interval '1 day')::DATE AS date), 
visit_dates AS (
SELECT visit_date 
FROM person_visits
WHERE person_id IN(1, 2)
)

SELECT date AS missing_date
FROM all_dates
EXCEPT
SELECT visit_date  AS missing_date
FROM visit_dates 
ORDER BY missing_date;