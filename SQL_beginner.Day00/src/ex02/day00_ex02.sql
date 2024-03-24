-- Using the SELECT statement using comparison signs (<=, >=)
SELECT
    p.name,
    p.rating
FROM
    pizzeria AS p
WHERE
    p.rating >= 3.5
    AND p.rating <= 5.0
ORDER BY
    p.rating DESC;

-- Using the SELECT statement using the BETWEEN keyword
SELECT
    p.name,
    p.rating
FROM
    pizzeria AS p
WHERE
    p.rating BETWEEN 3.5
                 AND 5.0
ORDER BY
    p.rating DESC;