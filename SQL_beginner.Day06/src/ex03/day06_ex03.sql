CREATE UNIQUE INDEX
      idx_person_discounts_unique ON person_discounts (person_id, pizzeria_id);

SET ENABLE_SEQSCAN TO OFF;

EXPLAIN ANALYZE
SELECT
      person_id,
      pizzeria_id
  FROM
      person_discounts;

-- A unique index does not allow duplicates creation of the columns specified
-- in the index. Let's check this by adding a new row to the "person_discounts"
INSERT INTO
      person_discounts (id, person_id, pizzeria_id, discount)
VALUES
      (16, 9, 6, 22);

SET ENABLE_SEQSCAN TO ON;