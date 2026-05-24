-- Schema: CREATE TABLE "leap" ( "year" INT, "is_leap" BOOL);
-- Task: update the leap table and set the is_leap based on the year field.
UPDATE "leap"
SET is_leap =
    CASE
        WHEN mod("year", 4)   != 0 THEN
            false
        WHEN mod("year", 100) != 0 THEN
            true
        WHEN mod("year", 400)  = 0 THEN
            true
        ELSE
            false
    END;