SELECT
      o.order_date,
      p.name  ||  ' '  ||
      '(age:' || p.age ||
      ')' AS person_information
  FROM
      person AS p(person_id)
NATURAL JOIN
      person_order AS o
 ORDER BY
      order_date ASC,
      person_information ASC;