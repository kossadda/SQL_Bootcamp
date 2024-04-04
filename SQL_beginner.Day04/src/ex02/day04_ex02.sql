CREATE VIEW
      v_generated_dates AS
SELECT
      d.generated_date::date
  FROM
      GENERATE_SERIES (TIMESTAMP '2022-01-01', '2022-01-31', '1 day')
      AS d(generated_date)
 ORDER BY
      d.generated_date;