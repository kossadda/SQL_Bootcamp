  WITH
      visits AS
      (SELECT
             pizzeria_id,
             COUNT(*)
         FROM
             person_visits AS pv
        GROUP BY
             pizzeria_id),
      orders AS
      (SELECT
             pizzeria_id,
             COUNT(*)
         FROM
             person_order AS po
         JOIN
             menu AS m ON po.menu_id = m.id
        GROUP BY
             pizzeria_id)
SELECT
      pz.name,
      v.count + o.count AS total_count 
  FROM
      visits AS v
  JOIN
      orders AS o USING(pizzeria_id)
  JOIN
      pizzeria AS pz ON pizzeria_id = pz.id
 ORDER BY
      total_count DESC,
      name ASC;