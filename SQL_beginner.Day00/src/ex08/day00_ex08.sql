SELECT
      *
  FROM
	person_order AS o
 WHERE
	o.id % 2 = 0
 ORDER BY
      o.id ASC;