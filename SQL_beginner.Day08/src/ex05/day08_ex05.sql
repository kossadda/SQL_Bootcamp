-- FIRST SESSION
BEGIN;

-- SECOND SESSION
BEGIN;

-- FIRST SESSION
SELECT
      SUM(rating)
  FROM
      pizzeria
HAVING
      SUM(rating) > 20;

-- SECOND SESSION
UPDATE pizzeria SET rating = 1.0 WHERE name = 'Pizza Hut';

COMMIT;

-- FIRST SESSION
SELECT
      SUM(rating)
  FROM
      pizzeria
HAVING
      SUM(rating) > 20;

COMMIT;

-- BOTH SESSIONS
SELECT
      SUM(rating)
  FROM
      pizzeria
HAVING
      SUM(rating) > 20;