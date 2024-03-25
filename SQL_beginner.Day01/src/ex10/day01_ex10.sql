SELECT 
      p.person_name,
      m.pizza_name,
      pz.name AS pizzeria_name
  FROM 
      person AS p(id, person_name)
  JOIN
      person_order AS po ON (p.id = po.person_id)
  JOIN
      menu AS m ON (m.id = po.menu_id)
  JOIN
      pizzeria AS pz ON (pz.id = m.pizzeria_id)
 ORDER BY
      person_name ASC,
      pizza_name ASC,
      pizzeria_name ASC;