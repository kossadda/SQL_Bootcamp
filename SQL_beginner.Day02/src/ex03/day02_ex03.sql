  WITH
      d AS
      (SELECT
             d.day::date
         FROM
             GENERATE_SERIES
             (TIMESTAMP '2022-01-01', '2022-01-10', '1 day') AS d(day)),
      v AS
      (SELECT
             pv.visit_date
         FROM
             person_visits AS pv
        WHERE
             pv.person_id = 1
             OR pv.person_id = 2
      )
SELECT
      d.day AS missing_date
  FROM
      d
  LEFT JOIN
      v ON (d.day = v.visit_date)
 WHERE
      v.visit_date IS NULL
 ORDER BY
      d.day;