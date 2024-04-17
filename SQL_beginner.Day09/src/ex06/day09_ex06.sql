BEGIN;
--------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION
      fnc_person_visits_and_eats_on_date
      (pperson VARCHAR DEFAULT 'Dmitriy',
       pprice  NUMERIC DEFAULT 500,
       pdate   DATE    DEFAULT '2022-01-08')
RETURNS TABLE(pizzeria_name VARCHAR) AS 
$$ BEGIN
      RETURN QUERY
      SELECT DISTINCT
            pz.pizzeria_name
      FROM
            person_visits AS pv(visit_id)
      JOIN
            person AS p(person_id) USING(person_id)
      JOIN
            menu AS m(menu_id) USING(pizzeria_id)
      JOIN
            pizzeria AS pz(pizzeria_id, pizzeria_name) USING(pizzeria_id)
      WHERE
            name = $1 AND price < $2 AND visit_date = $3;
END $$
LANGUAGE PLPGSQL IMMUTABLE;
--------------------------------------------------------------------------------
SELECT
      *
  FROM
      fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT
      *
  FROM
      fnc_person_visits_and_eats_on_date
      (pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
--------------------------------------------------------------------------------
ROLLBACK;
COMMIT;