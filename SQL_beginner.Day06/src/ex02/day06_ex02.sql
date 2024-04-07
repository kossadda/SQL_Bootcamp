SELECT
      name,
      pizza_name,
      price,
      ROUND((price - price * discount / 100), 2) AS discount_price,
      pizzeria_name
  FROM
      person_order AS po(order_id)
NATURAL JOIN
      menu AS m(menu_id)
NATURAL JOIN
      person AS p(person_id)
NATURAL JOIN
      pizzeria AS pz(pizzeria_id, pizzeria_name)
NATURAL JOIN
      person_discounts AS pd(discount_id)
 ORDER BY
      name ASC,
      pizza_name ASC;