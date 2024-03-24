SELECT DISTINCT
    v.person_id
FROM
    person_visits AS v
WHERE
    (v.visit_date BETWEEN '2022-01-06' 
                      AND '2022-01-09')
    OR v.pizzeria_id = 2
ORDER BY
    v.person_id DESC;