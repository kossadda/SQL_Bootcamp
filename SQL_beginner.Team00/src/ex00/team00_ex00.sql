CREATE TABLE nodes
(
      "point1" TEXT NOT NULL,
      "point2" TEXT NOT NULL,
      "cost"   INT  NOT NULL,
      CONSTRAINT uk_nodes UNIQUE(point1, point2)
)

INSERT INTO
      nodes
VALUES
      ('a', 'b', 10),
      ('a', 'c', 15),
      ('a', 'd', 20),
      ('b', 'a', 10),
      ('b', 'd', 25),
      ('b', 'c', 35),
      ('c', 'b', 35),
      ('c', 'd', 30),
      ('c', 'a', 15),
      ('d', 'a', 20),
      ('d', 'b', 25),
      ('d', 'c', 30)

  WITH RECURSIVE all_nodes(point1, point2, tour, total_cost) AS (
      SELECT
            point1, point2,
            point1 || ',' || point2 AS tour,
            cost AS total_cost
        FROM
            nodes
       WHERE
            point1 = 'a'
       UNION ALL
      SELECT
            n.point1, n.point2,
            an.tour || ',' || n.point2 AS tour,
            an.total_cost + n.cost AS total_cost
        FROM
            all_nodes AS an
        JOIN
            nodes AS n ON an.point2  = n.point1 AND an.point1 != n.point2
       WHERE
            LENGTH(tour) < (SELECT COUNT(DISTINCT point1) * 2 FROM nodes))
SELECT
      total_cost,
      '{' || tour || '}' AS tour
  FROM
      all_nodes
 WHERE
      LENGTH(tour) = (SELECT COUNT(DISTINCT point1) * 2 + 1 FROM nodes)
      AND LEFT(tour, 1) = RIGHT(tour, 1)
 ORDER BY
      total_cost ASC,
      tour ASC
 LIMIT
      1;