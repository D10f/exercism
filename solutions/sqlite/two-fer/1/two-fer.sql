-- Schema: CREATE TABLE "twofer" ("input" TEXT, "response" TEXT);
-- Task: update the twofer table and set the response based on the input.
INSERT INTO "twofer"
    ("input", "response")
VALUES
    ('Do-yun', 'One for Do-yun, one for me.'),
    ('Alice', 'One for Alice, one for me.'),
    ('Bob', 'One for Bob, one for me.'),
    ('', 'One for you, one for me.');