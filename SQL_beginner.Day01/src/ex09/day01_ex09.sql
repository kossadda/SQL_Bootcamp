SELECT
      p.name
FROM
      pizzeria AS p
WHERE 
      p.id NOT IN
      (SELECT
             pv.pizzeria_id
         FROM
             person_visits AS pv);

SELECT
      p.name
  FROM
      pizzeria AS p
 WHERE
      NOT EXISTS
      (SELECT
             p.name
         FROM
             person_visits AS pv
        WHERE
             p.id = pv.pizzeria_id);