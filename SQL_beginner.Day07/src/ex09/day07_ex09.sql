  WITH
      comp AS
      (SELECT
             address,
             MAX(age)::NUMERIC - ((MIN(age))::NUMERIC / MAX(age)) AS formula,
             AVG(age)::NUMERIC AS average
         FROM
             person AS p
        GROUP BY
             address)
SELECT
      address,
      ROUND(formula, 2) AS formula,
      ROUND(average, 2) AS average,
      formula > average AS comparison
  FROM
      comp
 ORDER BY
      address ASC;