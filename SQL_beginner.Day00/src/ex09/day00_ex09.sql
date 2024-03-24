SELECT
      (SELECT
             p.name 
         FROM
             person AS p
   	    WHERE
             p.id = v.person_id
      ) AS person_name,
	  (SELECT
             pz.name
         FROM
             pizzeria AS pz
        WHERE
             pz.id = v.pizzeria_id
      ) AS pizzeria_name
  FROM
      person_visits AS v
 WHERE
      v.visit_date BETWEEN '2022-01-07' AND '2022-01-09'
 ORDER BY
      person_name ASC, pizzeria_name DESC;