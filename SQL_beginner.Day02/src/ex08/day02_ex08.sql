SELECT DISTINCT
      name
  FROM
      person AS p(person_id)
NATURAL JOIN
      person_order AS po(order_id)
NATURAL JOIN
      menu AS m(menu_id)
 WHERE
      pizza_name IN ('pepperoni pizza', 'mushroom pizza')
      AND address IN ('Moscow', 'Samara')
      AND gender = 'male'
 ORDER BY
      name DESC;