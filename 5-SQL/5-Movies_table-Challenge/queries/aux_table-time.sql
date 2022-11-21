-- DROP
DROP TABLE IF EXISTS "time_table";

-- CREATE
CREATE TABLE IF NOT EXISTS "time_table"
(
    "show_id" INTEGER,
    "hours" DECIMAL(20,2),
    "minutes" INTEGER,
    "seconds" INTEGER,
    CONSTRAINT fk_show_id FOREIGN KEY ("show_id" )
        REFERENCES streamers_titles("show_id")
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- INSERT

WITH instant AS (
    SELECT  show_id,
            duration,
            string_to_array(streamers_titles."duration", ' ') AS "duration_list"
    FROM
        streamers_titles
)

INSERT INTO "time_table" (
    "show_id",
    "hours",
    "minutes",
    "seconds"
)

SELECT  show_id,
        CASE
            WHEN "duration_list"[2] = 'Season' OR "duration_list"[2] = 'Seasons'  
                THEN  CAST("duration_list"[1] AS DECIMAL) * 10
            ELSE CAST("duration_list"[1] AS DECIMAL) / 60
        END AS "hours",

        CASE
            WHEN "duration_list"[2] = 'Season' OR "duration_list"[2] = 'Seasons' 
                THEN  CAST("duration_list"[1] AS INTEGER) * 10 * 60
            ELSE CAST("duration_list"[1] AS INTEGER)
        END AS "minutes",

        CASE
            WHEN "duration_list"[2] = 'Season' OR "duration_list"[2] = 'Seasons'  
                THEN  CAST("duration_list"[1] AS INTEGER) * 10 * 60 * 60
            ELSE CAST("duration_list"[1] AS INTEGER) * 60
        END AS "seconds"

FROM instant;


-- SELECT
SELECT * FROM "time_table";