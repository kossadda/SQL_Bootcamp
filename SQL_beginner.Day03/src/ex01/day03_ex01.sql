SELECT
      m.id AS menu_id
  FROM
      menu AS m
 WHERE
      m.id NOT IN
      (SELECT
             po.menu_id
         FROM
             person_order AS po)
 ORDER BY
      menu_id;