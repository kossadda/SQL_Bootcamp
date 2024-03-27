SELECT
      pizza_name,
      pizzeria_name
  FROM
      menu AS m(menu_id)
NATURAL JOIN
      pizzeria AS pz(pizzeria_id, pizzeria_name)
NATURAL JOIN
      person_order AS po(order_id)
NATURAL JOIN
      person AS p(person_id, person_name)
 WHERE
      person_name IN ('Denis', 'Anna')
 ORDER BY
      pizza_name ASC,
      pizzeria_name ASC;