SELECT DISTINCT
    p.name,
    (CASE
        WHEN p.name = 'Denis' 
        THEN TRUE
        ELSE FALSE
    END) AS check_name
FROM
    person AS p
WHERE
    p.id IN (
        SELECT
            person_id
        FROM
            person_order
        WHERE
            menu_id IN (13, 14, 18)
            AND order_date = '2022-01-07'
    );
