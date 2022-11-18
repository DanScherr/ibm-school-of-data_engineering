-- director
DROP TABLE IF ExISTS "disney_plus_titlesxcountry";

CREATE TABLE IF NOT ExISTS "disney_plus_titlesxcountry"
(
    "id" SERIAL UNIQUE NOT NULL PRIMARY KEY,
    "show_id" VARCHAR(10) NOT NULL,
    "name" VARCHAR(50) NOT NULL
);

WITH "instant_table" AS (
    SELECT 
        "show_id",
        TRIM(UNNEST(string_to_array(t."country", ',', ' ,'))) AS "country"
    FROM "disney_plus_titles" as t
)
INSERT INTO "disney_plus_titlesxcountry" AS dmt ("show_id", "name")
    SELECT DISTINCT "show_id", "country"
    FROM "instant_table"
        WHERE "country" IS NOT NULL
        ORDER BY "country";

SELECT * FROM "disney_plus_titlesxcountry";