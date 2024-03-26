SELECT DISTINCT
      p.name AS pizzeria_name,
      p.rating
  FROM
      pizzeria AS p
  LEFT JOIN
      person_visits AS pv
    ON
      p.id = pv.pizzeria_id
 WHERE
      pv.id IS NULL;