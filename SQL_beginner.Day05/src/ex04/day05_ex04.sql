CREATE UNIQUE INDEX
      idx_menu_unique ON menu (pizzeria_id, pizza_name);

SET ENABLE_SEQSCAN TO OFF;

EXPLAIN ANALYZE
SELECT
      pizzeria_id,
      pizza_name
  FROM
      menu
 WHERE
      pizzeria_id = 1;

-- A unique index does not allow the creation of duplicates of the columns
-- specified in the index. Let's check this by adding a new row to the "menu"
INSERT INTO
      menu (id, pizzeria_id, pizza_name, price)
VALUES
      (21, 4, 'mushroom pizza', 1000);

SET ENABLE_SEQSCAN TO ON;