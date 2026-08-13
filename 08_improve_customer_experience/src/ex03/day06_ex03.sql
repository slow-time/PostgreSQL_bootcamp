
CREATE INDEX idx_person_discounts_unique ON person_discounts (person_id, pizzeria_id);

SET ENABLE_SEQSCAN TO ON;
EXPLAIN ANALYZE 
SELECT *
FROM person_discounts
WHERE (pizzeria_id = 5 OR pizzeria_id = 6) AND person_id = 4;

SET ENABLE_SEQSCAN TO OFF;
EXPLAIN ANALYZE 
SELECT *
FROM person_discounts
WHERE (pizzeria_id = 5 OR pizzeria_id = 6) AND person_id = 4;