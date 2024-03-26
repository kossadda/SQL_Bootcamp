SELECT
      p.name
FROM
      pizzeria AS p
WHERE 
      name NOT IN
      (SELECT
            DISTINCT pz.name
      FROM
            person_visits AS pv
      NATURAL JOIN
            pizzeria AS pz(pizzeria_id)
      );

SELECT
      p.name
  FROM
      pizzeria AS p
 WHERE
      NOT EXISTS (
            SELECT
                  p.name
              FROM
                  person_visits AS pv
             WHERE
                  p.id = pv.pizzeria_id
      );