-- DELETE FROM currency 
-- WHERE id = 100 AND name = 'EUR' AND rate_to_usd = 0.85 AND updated = '2022-01-01 13:29';

-- DELETE FROM currency 
-- WHERE id = 100 AND name = 'EUR' AND rate_to_usd = 0.79 AND updated = '2022-01-08 13:29';


WITH post AS (
SELECT u.name, u.lastname, b.type, SUM(b.money) AS volume, b.currency_id AS id
FROM "user" u 
FULL JOIN balance b ON b.user_id = u.id
GROUP BY u.name, u.lastname, b.type, b.currency_id 
), 
last_r AS (
SELECT DISTINCT ON (id) *
FROM currency
ORDER BY id, updated DESC
)

SELECT COALESCE(p.name, 'not defined') AS name, 
COALESCE(p.lastname, 'not defined') AS lastname, 
type, volume, 
COALESCE(l.name, 'not defined') AS currency_name, 
COALESCE(l.rate_to_usd, 1)::REAL AS last_rate_to_usd, 
(volume * COALESCE(l.rate_to_usd, 1))::REAL AS total_volume_in_usd
FROM post p
FULL JOIN last_r l ON p.id = l.id
ORDER BY 1 DESC, 2, 3;