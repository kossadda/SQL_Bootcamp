SELECT
      p.name AS object_name
  FROM
      person AS p
UNION ALL
SELECT
      m.pizza_name AS object_name
  FROM
      menu AS m
 ORDER BY
      object_name ASC;