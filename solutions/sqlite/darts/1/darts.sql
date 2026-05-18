-- Schema: CREATE TABLE "darts" ("x" REAL, "y" REAL, score INTEGER);
-- Task: update the darts table and set the score based on the x and y values.
-- function distance_between_points(x1, y1, x2, y2)
--  return math.sqrt((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1))
-- end
UPDATE "darts" SET score =
    CASE
        WHEN sqrt(pow(0 - x, 2) + pow(0 - y, 2)) <= 1 THEN
            10
        WHEN sqrt(pow(0 - x, 2) + pow(0 - y, 2)) <= 5 THEN
            5
        WHEN sqrt(pow(0 - x, 2) + pow(0 - y, 2)) <= 10 THEN
            1
        ELSE
            0
    END;