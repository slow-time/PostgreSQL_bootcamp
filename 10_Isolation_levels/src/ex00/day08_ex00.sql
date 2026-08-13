BEGIN; -- для Session #1

UPDATE pizzeria p SET rating = 5 WHERE p.name = 'Pizza Hut'; -- для Session #1

SELECT rating FROM pizzeria WHERE pizzeria.name = 'Pizza Hut'; -- для Session #1 и Session #2

COMMIT; -- для Session #1

select * from pizzeria where name  = 'Pizza Hut'; -- для Session #1 и Session #2
