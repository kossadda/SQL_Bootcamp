SELECT
      o.order_date,
      p.person_information
  FROM
      person_order AS o
  LEFT JOIN (
      SELECT
            p.name  ||  ' '  ||
            '(age:' || p.age ||
            ')' AS person_information,
            p.id
        FROM
            person AS p
      ) AS p ON o.person_id = p.id
 ORDER BY
      order_date ASC,
      person_information ASC;