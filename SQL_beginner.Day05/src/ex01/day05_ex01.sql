-- By default, the query optimizer chooses between seq scan and index scan based
-- on their execution speed. In order for the query below to accurately perform
-- an index scan, we will disable the query optimizer.
SET ENABLE_SEQSCAN TO OFF;

EXPLAIN ANALYZE
SELECT
      pizza_name,
      pizzeria_name
  FROM
      menu AS m(menu_id)
NATURAL JOIN
      pizzeria AS pz(pizzeria_id, pizzeria_name);

SET ENABLE_SEQSCAN TO ON;