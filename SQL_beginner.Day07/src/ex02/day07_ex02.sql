(SELECT
       name,
       COUNT(*),
       'order'::VARCHAR AS action_type
   FROM
       person_order AS po
   JOIN
       menu AS m ON po.menu_id = m.id
   JOIN
       pizzeria AS pz ON m.pizzeria_id = pz.id
  GROUP BY
       pz.name
  LIMIT
       3)
UNION ALL
(SELECT
       name,
       COUNT(*),
       'visit'::VARCHAR
   FROM
       person_visits AS pv
   JOIN
       pizzeria AS pz ON pv.pizzeria_id = pz.id
  GROUP BY
       name
  LIMIT
       3)
  ORDER BY
       action_type ASC,
       count DESC;