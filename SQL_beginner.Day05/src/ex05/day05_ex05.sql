CREATE INDEX
      idx_person_order_order_date ON person_order (person_id, menu_id)
 WHERE
      order_date = '2022-01-01'

SET ENABLE_SEQSCAN TO OFF;

-- The index from job 03 "idx_person_order_multi" is very similar to the index
-- of this job, except that the order_date is not tracked by any order, namely
-- "2022-01-01". The below query is suitable for both indexes, but since the
-- index we need is more focused on the required sample, the analyzer will
-- prefer this index instead of the index from task 03
EXPLAIN ANALYZE
SELECT
      person_id, menu_id
  FROM
      person_order
 WHERE
      order_date = '2022-01-01';

SET ENABLE_SEQSCAN TO ON;