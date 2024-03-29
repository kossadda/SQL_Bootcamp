  WITH
      common AS
      (SELECT
             pizzeria_id,
             pizza_name,
             pizzeria_name,
             price
         FROM
             menu AS m(menu_id)
      NATURAL JOIN
             pizzeria AS pz(pizzeria_id, pizzeria_name))
SELECT
      pizza_name,
      pizzeria_name_1,
      pizzeria_name_2,
      price
  FROM
      common AS first(pizzeria_id_1, pizza_name, pizzeria_name_1, price)
NATURAL JOIN
      common AS second(pizzeria_id_2, pizza_name, pizzeria_name_2, price)
 WHERE
      pizzeria_id_1 > pizzeria_id_2
 ORDER BY
      pizza_name ASC;