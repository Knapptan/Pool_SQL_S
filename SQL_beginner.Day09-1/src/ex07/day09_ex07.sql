CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr numeric[])
RETURNS numeric AS $BODY$
SELECT MIN(min_value)
FROM unnest(arr) min_value;
$BODY$
LANGUAGE sql;

DROP FUNCTION func_minimum;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);