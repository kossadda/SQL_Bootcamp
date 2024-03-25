SELECT
      p.id AS person_id,
      p.name AS person_name,
      p.age,
      p.gender,
      p.address,
      pz.id AS pizzeria_id,
      pz.name AS pizzeria_name,
      pz.rating
  FROM
      person AS p
      CROSS JOIN
      pizzeria AS pz
 ORDER BY
      person_id ASC,
      pizzeria_id ASC;
