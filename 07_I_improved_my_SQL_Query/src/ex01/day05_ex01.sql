
SET ENABLE_SEQSCAN TO ON;
EXPLAIN ANALYZE 
SELECT m.pizza_name  AS pizza_name, p.name AS pizzeria_name
FROM menu AS m
JOIN pizzeria AS p ON m.pizzeria_id = p.id;

SET ENABLE_SEQSCAN TO OFF;
EXPLAIN ANALYZE 
SELECT m.pizza_name  AS pizza_name, p.name AS pizzeria_name
FROM menu AS m
JOIN pizzeria AS p ON m.pizzeria_id = p.id;