-- Para passarmos para a segunda forma normal os registros na tabela, que não são chaves,
-- devem depender da chave primária em sua totalidade e não apenas parte dela.

-- director
DROP TABLE IF ExISTS "disney_plus_titlesxdirectors";

CREATE TABLE IF NOT ExISTS "disney_plus_titlesxdirectors"
(
    "id" SERIAL UNIQUE NOT NULL PRIMARY KEY,
    "show_id" VARCHAR(10) NOT NULL,
    "name" VARCHAR(50) NOT NULL
);

WITH "instant_table" AS (
    SELECT 
        "show_id",
        "type",
        "title",
        TRIM(UNNEST(string_to_array(t."director", ',', ' ,'))) AS "director",
        TRIM(UNNEST(string_to_array(t."cast", ',', ' ,'))) AS "cast",
        "country",
        "date_added",
        "release_year",
        "rating",
        "duration",
        TRIM(UNNEST(string_to_array(t."listed_in", ',', ' ,'))) AS "listed_in",
        "description"
    FROM "disney_plus_titles" as t
)
INSERT INTO "disney_plus_titlesxdirectors" AS dmt ("show_id", "name")
    SELECT DISTINCT "show_id", "director"
    FROM "instant_table"
        WHERE "director" IS NOT NULL
        ORDER BY "director";

SELECT * FROM "disney_plus_titlesxdirectors"; -- percebe-se uma relação de nxm
    

-- cast
DROP TABLE IF ExISTS "disney_plus_titlesxcast";

CREATE TABLE IF NOT ExISTS "disney_plus_titlesxcast"
(
    "id" SERIAL UNIQUE NOT NULL PRIMARY KEY,
    "show_id" VARCHAR(10) NOT NULL,
    "name" VARCHAR(120) NOT NULL
);

WITH "instant_table" AS (
    SELECT 
        "show_id",
        "type",
        "title",
        TRIM(UNNEST(string_to_array(t."director", ',', ' ,'))) AS "director",
        TRIM(UNNEST(string_to_array(t."cast", ',', ' ,'))) AS "cast",
        "country",
        "date_added",
        "release_year",
        "rating",
        "duration",
        TRIM(UNNEST(string_to_array(t."listed_in", ',', ' ,'))) AS "listed_in",
        "description"
    FROM "disney_plus_titles" as t
)
INSERT INTO "disney_plus_titlesxcast" AS dmt ("show_id", "name")
    SELECT DISTINCT "show_id", "cast"
    FROM "instant_table"
        WHERE "cast" IS NOT NULL
        ORDER BY "cast";

SELECT * FROM "disney_plus_titlesxcast"; -- percebe-se uma relação de nxm


-- listed_in
DROP TABLE IF ExISTS "disney_plus_titlesxlisted_in";

CREATE TABLE IF NOT ExISTS "disney_plus_titlesxlisted_in"
(
    "id" SERIAL UNIQUE NOT NULL PRIMARY KEY,
    "show_id" VARCHAR(10) NOT NULL,
    "name" VARCHAR(120) NOT NULL
);

WITH "instant_table" AS (
    SELECT 
        "show_id",
        "type",
        "title",
        TRIM(UNNEST(string_to_array(t."director", ',', ' ,'))) AS "director",
        TRIM(UNNEST(string_to_array(t."cast", ',', ' ,'))) AS "cast",
        "country",
        "date_added",
        "release_year",
        "rating",
        "duration",
        TRIM(UNNEST(string_to_array(t."listed_in", ',', ' ,'))) AS "listed_in",
        "description"
    FROM "disney_plus_titles" as t
)
INSERT INTO "disney_plus_titlesxlisted_in" AS dmt ("show_id", "name")
    SELECT DISTINCT "show_id", "listed_in"
    FROM "instant_table"
        WHERE "listed_in" IS NOT NULL
        ORDER BY "listed_in";

SELECT * FROM "disney_plus_titlesxlisted_in"; -- percebe-se uma relação de nxm
