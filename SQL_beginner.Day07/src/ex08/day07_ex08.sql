SELECT
      p.address,
      pz.name,
      COUNT(*) AS count_of_orders
  FROM
      person_order AS po
  JOIN
      person AS p ON po.person_id = p.id
  JOIN
      menu AS m ON po.menu_id = m.id
  JOIN
      pizzeria AS pz ON m.pizzeria_id = pz.id
 GROUP BY
      p.address, pz.name
 ORDER BY
      p.address ASC,
      pz.name ASC;