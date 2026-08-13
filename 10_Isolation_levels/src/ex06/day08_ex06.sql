BEGIN; -- Session #1
BEGIN; -- Session #2

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- Session #1
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- Session #2

SELECT SUM(rating) FROM pizzeria; -- Session #1

INSERT INTO pizzeria (id, name, rating) VALUES (11, 'Kazan Pizza 2', 4); -- Session #2
COMMIT; -- Session #2

SELECT SUM(rating) FROM pizzeria; -- Session #1
COMMIT; -- Session #1

SELECT SUM(rating) FROM pizzeria; -- Session #1
SELECT SUM(rating) FROM pizzeria; -- Session #2