SELECT
      p.name
  FROM
      person AS p
 WHERE
      p.gender = 'female'
      AND p.age > 25
 ORDER BY
      p.name ASC;