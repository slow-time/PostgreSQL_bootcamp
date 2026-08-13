CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE(col INTEGER) AS
$$
WITH RECURSIVE rec(a,b) AS (
SELECT 0, 1
UNION ALL
SELECT b, a + b
FROM rec
WHERE b < pstop
)
SELECT a FROM rec;
$$ LANGUAGE sql;


select * from fnc_fibonacci(100);
select * from fnc_fibonacci();

