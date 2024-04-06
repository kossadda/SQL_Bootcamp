INSERT INTO
      person_order (id, person_id, menu_id, order_date)
VALUES (
      (SELECT COUNT(*) FROM person_order) + 1,
      (SELECT p.id FROM person AS p WHERE p.name = 'Denis'),
      (SELECT m.id FROM menu AS m WHERE m.pizza_name = 'sicilian pizza'),
      (TIMESTAMP '2022-02-24')),
      (
      (SELECT COUNT(*) FROM person_order) + 2,
      (SELECT p.id FROM person AS p WHERE p.name = 'Irina'),
      (SELECT m.id FROM menu AS m WHERE m.pizza_name = 'sicilian pizza'),
      (TIMESTAMP '2022-02-24'));