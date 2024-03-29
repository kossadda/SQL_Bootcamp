   WITH 
       visits AS
       (SELECT
              pz.pizzeria_name,
              p.gender
          FROM
              person_visits AS pv(visit_id)
       NATURAL JOIN
              person AS p(person_id, person_name)
       NATURAL JOIN
              pizzeria AS pz(pizzeria_id, pizzeria_name)),
       male AS
       (SELECT
              v.pizzeria_name
          FROM
              visits AS v
         WHERE
              v.gender = 'male'),
       female AS
       (SELECT
              v.pizzeria_name
          FROM
              visits AS v
         WHERE
              v.gender = 'female')
(SELECT
       *
   FROM
       male
 EXCEPT ALL
 SELECT
       *
   FROM
       female)
  UNION ALL
(SELECT
       *
   FROM
       female
 EXCEPT ALL
 SELECT
       *
   FROM
       male)
  ORDER BY
       pizzeria_name ASC;