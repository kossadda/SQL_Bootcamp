INSERT INTO
      person_visits (id, person_id, pizzeria_id, visit_date)
VALUES (
      (SELECT COUNT(*) FROM person_visits) + 1,
      (SELECT p.id FROM person AS p WHERE p.name = 'Denis'),
      (SELECT pz.id FROM pizzeria AS pz WHERE pz.name = 'Dominos'),
      ('2022-02-24')),
      (
      (SELECT COUNT(*) FROM person_visits) + 2,
      (SELECT p.id FROM person AS p WHERE p.name = 'Irina'),
      (SELECT pz.id FROM pizzeria AS pz WHERE pz.name = 'Dominos'),
      ('2022-02-24'));