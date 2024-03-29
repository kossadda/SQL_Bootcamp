  WITH
      diff AS
      (SELECT
             pv.pizzeria_id,
             pv.visit_date
         FROM
             person AS p(person_id, person_name)
      NATURAL JOIN
             person_visits AS pv(visit_id)
        WHERE
             person_name = 'Andrey'
       EXCEPT   
       SELECT
             m.pizzeria_id,
             po.order_date
         FROM
             person AS p(person_id, person_name)
      NATURAL JOIN
             person_order AS po(order_id)
      NATURAL JOIN
             menu AS m(menu_id))
SELECT
      pizzeria_name
  FROM
      diff
NATURAL JOIN
      pizzeria AS pz(pizzeria_id, pizzeria_name)
 ORDER BY
      pizzeria_name;