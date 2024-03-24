SELECT
    p.name,
    p.age
FROM
    person AS p
WHERE
    p.gender  = 'female'
    AND p.address = 'Kazan'
ORDER BY
    p.name ASC;