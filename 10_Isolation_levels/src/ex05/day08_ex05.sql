SHOW TRANSACTION ISOLATION LEVEL; -- Session #1
SHOW TRANSACTION ISOLATION LEVEL; -- Session #2

BEGIN;-- Session #1
BEGIN;-- Session #2

SELECT SUM(rating) FROM pizzeria; -- Session #1

INSERT INTO pizzeria (id, name, rating) VALUES (10, 'Kazan Pizza', 5); -- Session #2
COMMIT; -- Session #2

SELECT SUM(rating) FROM pizzeria; -- Session #1
COMMIT; -- Session #1

SELECT SUM(rating) FROM pizzeria; -- Session #1
SELECT SUM(rating) FROM pizzeria; -- Session #2