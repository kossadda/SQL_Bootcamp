  WITH
      cbu AS
      (SELECT COALESCE(u.name, 'not defined') AS name,
              COALESCE(lastname, 'not defined') AS lastname, 
              money, c.name AS currency_name, type,
              rate_to_usd, c.updated AS cu, b.updated AS bu,
              CASE WHEN b.updated >= c.updated THEN b.updated - c.updated
                   ELSE c.updated - b.updated
              END AS diff
         FROM currency AS c(currency_id)
         JOIN balance AS b USING(currency_id)
    LEFT JOIN public.user AS u(user_id) USING(user_id)),
      min_cbu AS
      (SELECT name, lastname, money, currency_name, type, bu, MIN(diff) AS diff
         FROM cbu
     GROUP BY name, lastname, money, currency_name, type, bu)
SELECT
      name,
      lastname,
      currency_name,
      money * rate_to_usd AS currency_in_usd
  FROM
      min_cbu
  JOIN
      cbu USING(name, lastname, money, currency_name, type, bu, diff)
 ORDER BY
      name          DESC,
      lastname      ASC,
      currency_name ASC;