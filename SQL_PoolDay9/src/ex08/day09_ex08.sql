CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop bigint default 10)
RETURNS TABLE(a bigint) AS $BODY$
WITH RECURSIVE fibonacci_rec(a,b) AS
(SELECT 0 AS a, 1 AS b
	UNION ALL
 SELECT b, a + b FROM fibonacci_rec WHERE b < pstop)
SELECT a FROM fibonacci_rec;
$BODY$
LANGUAGE sql;

DROP FUNCTION fnc_fibonacci;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();