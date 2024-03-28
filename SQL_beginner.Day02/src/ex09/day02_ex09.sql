  WITH 
      list AS
      (SELECT
             name,
             pizza_name
         FROM
             person AS p(person_id)
      NATURAL JOIN
             person_order AS po(order_id)
      NATURAL JOIN
             menu AS m(menu_id)
        WHERE
             gender = 'female')
SELECT
      first.name
  FROM
      list AS first
 WHERE
      first.pizza_name = 'pepperoni pizza'
      AND EXISTS
      (SELECT
             second.name
         FROM
             list AS second
        WHERE
             pizza_name = 'cheese pizza'
             AND first.name = second.name)
 ORDER BY
      first.name ASC;