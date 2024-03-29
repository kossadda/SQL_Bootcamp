SELECT
      (SELECT
             p.name
         FROM
             person AS p
        WHERE
             p.id = pv.person_id
      ) AS person_name,
      (SELECT
             pz.name
         FROM
             pizzeria AS pz
        WHERE
             pz.id = pv.pizzeria_id
      ) AS pizzeria_name
  FROM
      (SELECT *
         FROM
             person_visits AS v
        WHERE
             v.visit_date BETWEEN '2022-01-07' AND '2022-01-09'
      ) AS pv
 ORDER BY
      person_name ASC,
      pizzeria_name DESC;