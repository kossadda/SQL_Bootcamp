BEGIN;
--------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION
      func_minimum(VARIADIC arr NUMERIC[])
RETURNS NUMERIC AS
      $$ SELECT MIN(unnest) FROM UNNEST($1); $$
LANGUAGE SQL STABLE;
--------------------------------------------------------------------------------
SELECT
      func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);
--------------------------------------------------------------------------------
ROLLBACK;
COMMIT;