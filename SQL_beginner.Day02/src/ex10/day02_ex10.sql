SELECT
      first.name AS person_name1,
      second.name AS person_name2,
      first.address AS common_address
  FROM
      person AS first
  LEFT JOIN
      person AS second
      ON (first.address = second.address
      AND first.name <> second.name)
 WHERE
      first.id > second.id
 ORDER BY
      first.name ASC,
      second.name ASC,
      first.address ASC;