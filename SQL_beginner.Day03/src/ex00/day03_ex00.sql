  WITH
      kate AS
      (SELECT
             p.id AS person_id,
             p.name AS person_name
         FROM
             person AS p
        WHERE
             p.name = 'Kate')
SELECT
      pizza_name,
      price,
      pizzeria_name,
      visit_date
  FROM
      kate
NATURAL JOIN
      person_visits AS pv(visit_id)
NATURAL JOIN
      pizzeria AS pz(pizzeria_id, pizzeria_name)
NATURAL JOIN
      menu AS m(menu_id)
 WHERE
      price BETWEEN 800 AND 1000
 ORDER BY
      pizza_name ASC,
      price ASC,
      pizzeria_name ASC;