-- Session 1
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Session 2
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Session 1
SELECT SUM(rating) FROM pizzeria; -- 23.5

-- Session 2
UPDATE pizzeria SET rating = 1 WHERE name = 'Pizza Hut';
COMMIT;

-- Session 1
SELECT SUM(rating) FROM pizzeria; -- 19.9
COMMIT;
SELECT SUM(rating) FROM pizzeria; -- 19.9

-- Session 2
SELECT SUM(rating) FROM pizzeria; -- 19.9
