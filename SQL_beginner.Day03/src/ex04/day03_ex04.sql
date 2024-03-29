   WITH 
       orders AS
       (SELECT
              pz.pizzeria_name,
              p.gender
          FROM
              person_order AS po(visit_id)
       NATURAL JOIN
              person AS p(person_id, person_name)
       NATURAL JOIN
              menu AS m(menu_id)
       NATURAL JOIN
              pizzeria AS pz(pizzeria_id, pizzeria_name)),
       male AS
       (SELECT
              o.pizzeria_name
          FROM
              orders AS o
         WHERE
              o.gender = 'male'),
       female AS
       (SELECT
              o.pizzeria_name
          FROM
              orders AS o
         WHERE
              o.gender = 'female')
(SELECT
       *
   FROM
       male
 EXCEPT
 SELECT
       *
   FROM
       female)
  UNION
(SELECT
       *
   FROM
       female
 EXCEPT
 SELECT
       *
   FROM
       male)
  ORDER BY
       pizzeria_name ASC;