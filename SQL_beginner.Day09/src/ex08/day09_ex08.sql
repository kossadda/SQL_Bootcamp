BEGIN;
--------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION
      fnc_fibonacci(pstop INT DEFAULT 100)
RETURNS TABLE(fibonacci INT) AS
$$
      WITH RECURSIVE fibonacci(prev, crnt) AS (
            SELECT 0::INT, 1::INT
            UNION ALL
            SELECT crnt, prev + crnt
            FROM fibonacci
            WHERE prev + crnt < $1
      )
      SELECT crnt
      FROM fibonacci;
$$
LANGUAGE SQL IMMUTABLE;
--------------------------------------------------------------------------------
SELECT
      *
  FROM
      fnc_fibonacci(100);

SELECT
      *
  FROM
      fnc_fibonacci();
--------------------------------------------------------------------------------
ROLLBACK;
COMMIT;