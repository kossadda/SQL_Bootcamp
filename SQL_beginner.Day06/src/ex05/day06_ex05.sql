COMMENT ON TABLE 
       person_discounts IS
       'This table stores discounts for persons in pizzerias';

COMMENT ON COLUMN 
       person_discounts.id IS
       'PRIMARY KEY for this table';

COMMENT ON COLUMN
       person_discounts.person_id IS
       'FOREIGN KEY referring to PRIMARY KEY for the person table';

COMMENT ON COLUMN
       person_discounts.pizzeria_id IS
       'FOREIGN KEY referring to PRIMARY KEY for the pizzeria table';

COMMENT ON COLUMN
       person_discounts.discount IS
       'Contains the discount amount for a specific person in pizzerias';

--------------------------------------------------------------------------------

SELECT
      obj_description(relfilenode, 'pg_class') AS table_comment,
      t.relname AS table_name,
      a.attname AS column_name,
      d.description AS column_comment
  FROM
      pg_class t
  JOIN
      pg_attribute a ON a.attrelid = t.oid
  LEFT JOIN
      pg_description d ON d.objoid = a.attrelid AND d.objsubid = a.attnum
 WHERE
      t.relname = 'person_discounts'
      AND a.attnum > 0
      AND NOT a.attisdropped;
