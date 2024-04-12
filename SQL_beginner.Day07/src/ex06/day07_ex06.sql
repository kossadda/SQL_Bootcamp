SELECT
      name,
      COUNT(*) AS count_of_orders,
      ROUND(AVG(price), 2) AS average_price,
      MAX(price) AS max_price,
      MIN(price) AS min_price
  FROM
      person_order AS po
  JOIN
      menu AS m ON po.menu_id = m.id
  JOIN
      pizzeria AS pz ON m.pizzeria_id = pz.id
 GROUP BY
      name
 ORDER BY
      name ASC;
      