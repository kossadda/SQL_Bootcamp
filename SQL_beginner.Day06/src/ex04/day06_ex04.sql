 ALTER TABLE
      person_discounts
 ALTER COLUMN
      discount SET DEFAULT 0,
   ADD CONSTRAINT
      ch_nn_person_id CHECK (person_id IS NOT NULL),
   ADD CONSTRAINT
      ch_nn_pizzeria_id CHECK (pizzeria_id IS NOT NULL),
   ADD CONSTRAINT
      ch_nn_discount CHECK (discount IS NOT NULL),
   ADD CONSTRAINT
      ch_range_discount CHECK (discount BETWEEN 0 AND 100);

-- Note that before creating CONSTRAINT, if person_id is filled to NULL, we
-- will not get an error even though this column is FOREIGN KEYS. The reason
-- is that the column referenced by FOREIGN KEYS is not constrained by
-- this CONSTRAINT.
INSERT INTO
      person_discounts (id, person_id, pizzeria_id, discount)
VALUES
      (16, NULL, 2, 22);

INSERT INTO
      person_discounts (id, person_id, pizzeria_id, discount)
VALUES
      (17, 9, NULL, 22);

INSERT INTO
      person_discounts (id, person_id, pizzeria_id, discount)
VALUES
      (18, 9, 2, NULL);

INSERT INTO
      person_discounts (id, person_id, pizzeria_id, discount)
VALUES
      (19, 9, 2, 101);

INSERT INTO
      person_discounts (id, person_id, pizzeria_id)
VALUES
      (20, 9, 2);