-- We will also describe the OWN BY keyword, which will allow the sequence to be
-- set as the owner of the specified column. This way the sequence will be
-- deleted when that column is deleted.
CREATE SEQUENCE
      seq_person_discounts AS INT
 OWNED BY
      person_discounts.id;

-- Since the table already contains rows, we will set the maximum id value in
-- the last value of the sequence
SELECT
      SETVAL('seq_person_discounts', MAX(id))
  FROM
      person_discounts;

-- Since our table already has rows and the type of the id attribute is not
-- SERIAL, it is necessary to set the DEFAULT value for id in the form of
-- NEXTVAL of sequence
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
      (4, 4, 22);

SELECT
      *
  FROM
      person_discounts;