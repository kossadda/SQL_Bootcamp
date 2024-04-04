(SELECT
       vpf.name
   FROM
       v_persons_female AS vpf)
  UNION
(SELECT
       vpm.name
   FROM
       v_persons_male AS vpm)
  ORDER BY
       name ASC;