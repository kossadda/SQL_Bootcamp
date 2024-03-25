SELECT
      p.visit_date AS action_date,
      p.person_id AS person_id
  FROM
      person_visits AS p
INTERSECT
SELECT
      o.order_date AS action_date,
      o.person_id AS person_id
  FROM
      person_order AS o
 ORDER BY
      action_date ASC,
      person_id DESC;