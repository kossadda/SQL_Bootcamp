CREATE SEQUENCE
      seq_person_discounts
 START
      1;

SELECT
      SETVAL('seq_person_discounts', MAX(id))
  FROM
      person_discounts;

SELECT
      *
  FROM
      seq_person_discounts;

 ALTER TABLE
      person_discounts
 ALTER COLUMN
      id SET DEFAULT NEXTVAL('seq_person_discounts');

INSERT INTO
      person_discounts (person_id, pizzeria_id, discount)
VALUES
      (9, 2, 22);

SELECT
      *
  FROM
      person_discounts;