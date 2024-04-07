INSERT INTO
      menu (id, pizzeria_id, pizza_name, price)
VALUES (
      (SELECT COUNT(*) FROM menu) + 1,
      (SELECT pz.id FROM pizzeria AS pz WHERE pz.name = 'Dominos'),
      ('sicilian pizza'),
      (900));