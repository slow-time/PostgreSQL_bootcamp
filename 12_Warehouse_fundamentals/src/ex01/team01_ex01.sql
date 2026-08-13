insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH post AS (
    SELECT u.name, u.lastname,  b.currency_id AS id, b.money,  b.updated AS balance_updated
    FROM "user" u 
    FULL JOIN balance b ON b.user_id = u.id
    WHERE b.currency_id IS NOT NULL
),
currency_rates AS (
    SELECT p.name, p.lastname, p.id, p.money,
        COALESCE((SELECT rate_to_usd FROM currency c WHERE c.id = p.id 
             AND c.updated <= p.balance_updated 
             ORDER BY c.updated DESC 
             LIMIT 1),
            (SELECT rate_to_usd FROM currency c  WHERE c.id = p.id 
             AND c.updated > p.balance_updated 
             ORDER BY c.updated ASC 
             LIMIT 1)
        ) AS final_rate
    FROM post p
),
last_r AS (
    SELECT DISTINCT ON (id) 
        id,
        name
    FROM currency
    ORDER BY id, updated DESC
)

SELECT 
    COALESCE(p.name, 'not defined') AS name, 
    COALESCE(p.lastname, 'not defined') AS lastname, 
    COALESCE(lr.name, 'not defined') AS currency_name,
    (p.money * COALESCE(p.final_rate, 1))::real AS currency_in_usd
FROM currency_rates p
LEFT JOIN last_r lr ON p.id = lr.id
WHERE p.final_rate IS NOT NULL OR lr.name IS NOT NULL
ORDER BY 
    name DESC, 
    lastname ASC, 
    currency_name ASC;