-- DROP
DROP TABLE IF EXISTS "time_table";

-- CREATE
CREATE TABLE IF NOT EXISTS "time_table"
(
    "id" SERIAL UNIQUE NOT NULL PRIMARY KEY,
    "show_id" VARCHAR(10),
    "hours" DECIMAL(20,2),
    "minutes" INTEGER,
    "seconds" INTEGER
);

-- INSERT

WITH instant AS (
    SELECT  show_id,
            duration,
            string_to_array(disney_plus_titles."duration", ' ') AS "duration_list"
    FROM
        disney_plus_titles
)

INSERT INTO "time_table" (
    "show_id",
    "hours",
    "minutes",
    "seconds"
)

SELECT  show_id,
        CASE
            WHEN "duration_list"[2] = 'Season' THEN  CAST("duration_list"[1] AS DECIMAL) * 10
            ELSE CAST("duration_list"[1] AS DECIMAL) / 60
        END AS "hours",

        CASE
            WHEN "duration_list"[2] = 'Season' THEN  CAST("duration_list"[1] AS INTEGER) * 10 * 60
            ELSE CAST("duration_list"[1] AS INTEGER)
        END AS "minutes",

        CASE
            WHEN "duration_list"[2] = 'Season' THEN  CAST("duration_list"[1] AS INTEGER) * 10 * 60 * 60
            ELSE CAST("duration_list"[1] AS INTEGER) * 60
        END AS "seconds"

FROM instant;


-- SELECT
SELECT * FROM "time_table";