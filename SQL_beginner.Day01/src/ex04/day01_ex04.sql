SELECT
      o.person_id AS person_id
  FROM
      person_order AS o
 WHERE
      o.order_date = '2022-01-07'
EXCEPT ALL
SELECT
      v.person_id AS person_id
  FROM
      person_visits AS v
 WHERE
      v.visit_date = '2022-01-07';
      