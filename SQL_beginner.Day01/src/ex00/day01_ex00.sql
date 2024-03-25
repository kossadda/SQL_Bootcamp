SELECT
      p.id AS object_id,
      p.name AS object_name
  FROM
      person AS p
UNION
SELECT
      m.id AS object_id,
      m.pizza_name AS object_name
  FROM
      menu AS m
 ORDER BY
      object_id ASC,
      object_name ASC;