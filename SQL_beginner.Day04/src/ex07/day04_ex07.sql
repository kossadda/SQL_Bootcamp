INSERT INTO
      person_visits
VALUES (
      (SELECT COUNT(*) + 1 FROM person_visits),
      (SELECT p.id FROM person AS p WHERE name = 'Dmitriy'),
      (SELECT DISTINCT
             pizzeria_id
         FROM
             (SELECT name FROM pizzeria
              EXCEPT
              SELECT * FROM mv_dmitriy_visits_and_eats) AS no_visit
       NATURAL JOIN
             pizzeria AS pz(pizzeria_id)
       NATURAL JOIN
             menu AS m(menu_id)
        WHERE
             price < 800
        LIMIT 1),
      '2022-01-08');

REFRESH MATERIALIZED VIEW
       mv_dmitriy_visits_and_eats;

SELECT
      *
  FROM
      mv_dmitriy_visits_and_eats