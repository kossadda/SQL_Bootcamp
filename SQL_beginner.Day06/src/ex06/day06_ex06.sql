CREATE SEQUENCE
      seq_person_discounts
 START
      (SELECT MAX(id) FROM person_discounts);

 ALTER TABLE
      person_discounts
 ALTER COLUMN
      id SET DEFAULT NEXTVAL('seq_person_discounts');

-- Please note that if the insertion fails, the sequence will still be
-- incremented. To prevent incrementation, transactional ones should be
-- used. Since we have not yet reached this topic, we will leave everything
-- in its current form.
INSERT INTO
      person_discounts (person_id, pizzeria_id, discount)
VALUES
      (9, 2, 22);

SELECT
      *
  FROM
      person_discounts;