BEGIN;
--------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION 
      fnc_trg_person_update_audit()
RETURNS TRIGGER AS $$
 BEGIN
      INSERT INTO
            person_audit(type_event, row_id, name, age, gender, address)
      SELECT
            'U', OLD.*;
      RETURN NULL;
   END $$ 
LANGUAGE plpgsql VOLATILE;

CREATE TRIGGER
      trg_person_update_audit
 AFTER UPDATE ON
      person FOR EACH ROW
EXECUTE FUNCTION 
      fnc_trg_person_update_audit();
--------------------------------------------------------------------------------
UPDATE
      person
   SET
      name = 'Bulat'
 WHERE id = 10;

UPDATE
      person
   SET
      name = 'Damir'
 WHERE id = 10;
--------------------------------------------------------------------------------
SELECT
      *
  FROM
      person_audit;
--------------------------------------------------------------------------------
ROLLBACK;
COMMIT;