SELECT
      v.action_date,
      p.name AS person_name
  FROM
      person AS p
  LEFT JOIN (
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
            person_id DESC
      ) AS v ON p.id = v.person_id
 ORDER BY
      action_date ASC,
      person_name DESC;