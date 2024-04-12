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
             pizzeria_id),
      joined AS
      (SELECT
             pizzeria_id,
             COALESCE(visits.count, 0) + COALESCE(orders.count, 0) AS total_count
         FROM
             visits
         FULL JOIN
             orders USING(pizzeria_id))
SELECT
      pz.name,
      total_count 
  FROM
      joined AS j
  JOIN
      pizzeria AS pz ON j.pizzeria_id = pz.id
 ORDER BY
      total_count DESC,
      name ASC;