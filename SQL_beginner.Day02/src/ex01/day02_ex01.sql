SELECT
      d.day::date AS missing_date
  FROM
      GENERATE_SERIES
      (TIMESTAMP '2022-01-01', '2022-01-10', '1 day') AS d(day)
  LEFT JOIN
      (SELECT
             pv.visit_date
         FROM
             person_visits AS pv
        WHERE 
             pv.person_id = 1
             OR pv.person_id = 2
      ) AS v ON (d.day = v.visit_date)
 WHERE 
      v.visit_date IS NULL
 ORDER BY
      d.day;