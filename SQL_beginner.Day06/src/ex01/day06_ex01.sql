INSERT INTO
      person_discounts (id, person_id, pizzeria_id, discount)
SELECT
      ROW_NUMBER() OVER (ORDER BY po.person_id ASC, m.pizzeria_id) AS id,
      person_id,
      pizzeria_id,
      (CASE 
            WHEN COUNT(*) = 1 THEN 10.5
            WHEN COUNT(*) = 2 THEN 22
            ELSE 30
      END) AS discount
  FROM
      person_order AS po(order_id)
NATURAL JOIN
      menu AS m(menu_id)
 GROUP BY
      person_id, pizzeria_id;