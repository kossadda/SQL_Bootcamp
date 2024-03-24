SELECT DISTINCT
      (SELECT
             p.name
         FROM
             person AS p
        WHERE
             p.id = o.person_id
      ) AS name,
      (CASE
           WHEN
               (SELECT
                      p.name
                  FROM 
                      person AS p
                 WHERE 
                      p.id = o.person_id
                ) = 'Denis'
           THEN TRUE
           ELSE FALSE
      END) AS check_name
  FROM
      person_order AS o
 WHERE
      (o.menu_id = 13
      OR o.menu_id = 14
      OR o.menu_id = 18)
      AND o.order_date = '2022-01-07'