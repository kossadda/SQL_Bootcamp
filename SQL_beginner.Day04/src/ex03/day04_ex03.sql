SELECT
      vgd.generated_date AS missing_date
  FROM
      v_generated_dates AS vgd
  LEFT JOIN
      person_visits AS pv ON (vgd.generated_date = pv.visit_date)
 WHERE
      visit_date IS NULL
 ORDER BY
      missing_date ASC;