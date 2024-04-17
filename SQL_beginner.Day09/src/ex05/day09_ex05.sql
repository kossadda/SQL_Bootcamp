BEGIN;
--------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS fnc_persons_male();
DROP FUNCTION IF EXISTS fnc_persons_female();
--------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION
      fnc_persons(pgender VARCHAR DEFAULT 'female')
RETURNS SETOF person AS 
      $$ SELECT * FROM person WHERE gender = $1; $$
LANGUAGE SQL IMMUTABLE;
--------------------------------------------------------------------------------
SELECT
      *
  FROM
      fnc_persons(pgender := 'male');

SELECT
      *
  FROM
      fnc_persons();
--------------------------------------------------------------------------------
ROLLBACK;
COMMIT;