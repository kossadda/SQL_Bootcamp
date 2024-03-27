SELECT
      m.pizza_name,
      (SELECT
             pz.name
         FROM
             pizzeria AS pz
        WHERE
             pz.id = m.pizzeria_id) AS pizzeria_name,
      m.price
  FROM
      menu AS m
 WHERE
      m.pizza_name = 'mushroom pizza'
      OR m.pizza_name = 'pepperoni pizza'
 ORDER BY
      pizza_name ASC,
      pizzeria_name ASC;