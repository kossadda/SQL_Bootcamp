SELECT
      COALESCE(p.name, '-') AS person_name,
      v.visit_date,
      COALESCE(pz.name, '-') AS pizzeria_name
  FROM
      (SELECT
             pv.person_id,
             pv.pizzeria_id,
             pv.visit_date
         FROM
             person_visits AS pv
        WHERE
             pv.visit_date BETWEEN '2022-01-01'
                               AND '2022-01-03'
      ) AS v
  FULL JOIN
      person AS p ON (v.person_id = p.id)
  FULL JOIN
      pizzeria AS pz ON (v.pizzeria_id = pz.id)
 ORDER BY
      person_name ASC,
      visit_date ASC,
      pizzeria_name ASC;