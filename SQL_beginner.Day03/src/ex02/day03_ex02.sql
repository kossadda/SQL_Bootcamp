SELECT
      m.pizza_name,
      m.price,
      pz.name AS pizzeria_name
  FROM
      menu AS m(menu_id)
  JOIN
      pizzeria AS pz ON (m.pizzeria_id = pz.id)
 WHERE
      menu_id NOT IN
      (SELECT
             po.menu_id
         FROM
             person_order AS po)
 ORDER BY
      m.pizza_name ASC,
      m.price ASC;