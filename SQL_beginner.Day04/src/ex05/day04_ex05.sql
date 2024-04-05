CREATE VIEW
      v_price_with_discount AS
SELECT
      name,
      pizza_name,
      price,
      (price - price * 0.1)::int AS discount_price
  FROM
      person_order AS po(order_id)
NATURAL JOIN
      menu AS m(menu_id)
NATURAL JOIN
      person AS p(person_id)
 ORDER BY
      name ASC,
      pizza_name ASC;