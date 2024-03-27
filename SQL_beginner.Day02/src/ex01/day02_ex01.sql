SELECT
      d.day AS missing_date
  FROM
      (VALUES
            (DATE '2022-01-01'), (DATE '2022-01-02'), (DATE '2022-01-03'),
            (DATE '2022-01-04'), (DATE '2022-01-05'), (DATE '2022-01-06'),
            (DATE '2022-01-07'), (DATE '2022-01-08'), (DATE '2022-01-09'),
            (DATE '2022-01-10')
      ) AS d(day)
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
      d.day