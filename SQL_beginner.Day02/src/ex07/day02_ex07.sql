SELECT DISTINCT
      pizzeria_name
  FROM
      person AS p(person_id, person_name)
NATURAL JOIN
      person_visits AS pv(visit_id)
NATURAL JOIN
      pizzeria AS pz(pizzeria_id, pizzeria_name)
NATURAL JOIN
      menu AS m(menu_id)
 WHERE
      visit_date = '2022-01-08'
      AND person_name = 'Dmitriy'
      AND price < 800;