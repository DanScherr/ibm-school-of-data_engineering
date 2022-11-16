-- Para passarmos para a segunda forma normal os registros na tabela, que não são chaves,
-- devem depender da chave primária em sua totalidade e não apenas parte dela.

-- director
DROP TABLE IF EXISTS "disney_plus_titlesXdirectors";

CREATE TABLE IF NOT EXISTS "disney_plus_titlesXdirectors"
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
INSERT INTO "disney_plus_titlesXdirectors" AS dmt ("show_id", "name")
    SELECT DISTINCT "show_id", "director"
    FROM "instant_table"
        WHERE "director" IS NOT NULL
        ORDER BY "director";

SELECT * FROM "disney_plus_titlesXdirectors"; -- percebe-se uma relação de nXm
    

-- cast
DROP TABLE IF EXISTS "disney_plus_titlesXcast";

CREATE TABLE IF NOT EXISTS "disney_plus_titlesXcast"
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
INSERT INTO "disney_plus_titlesXcast" AS dmt ("show_id", "name")
    SELECT DISTINCT "show_id", "cast"
    FROM "instant_table"
        WHERE "cast" IS NOT NULL
        ORDER BY "cast";

SELECT * FROM "disney_plus_titlesXcast"; -- percebe-se uma relação de nXm


-- listed_in
DROP TABLE IF EXISTS "disney_plus_titlesXlisted_in";

CREATE TABLE IF NOT EXISTS "disney_plus_titlesXlisted_in"
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
INSERT INTO "disney_plus_titlesXlisted_in" AS dmt ("show_id", "name")
    SELECT DISTINCT "show_id", "listed_in"
    FROM "instant_table"
        WHERE "listed_in" IS NOT NULL
        ORDER BY "listed_in";

SELECT * FROM "disney_plus_titlesXlisted_in"; -- percebe-se uma relação de nXm

-- ATUALIZANDO A disney_plus_titles
ALTER TABLE disney_plus_titles
    ADD COLUMN IF NOT EXISTS "titleXdirector_id" SMALLINT,
    ADD COLUMN IF NOT EXISTS "titleXcast_id" SMALLINT,
    ADD COLUMN IF NOT EXISTS "titleXlistedin_id" SMALLINT;

UPDATE disney_plus_titles AS dmt 
    SET ("show_id", "titleXdirector_id") = (dptd."show_id", dptd."id")
    FROM "disney_plus_titlesXdirectors" AS dptd
    WHERE dmt."show_id" = dptd."show_id";

UPDATE disney_plus_titles AS dmt 
    SET ("show_id", "titleXcast_id") = (dptd."show_id", dptd."id")
    FROM "disney_plus_titlesXcast" AS dptd
    WHERE dmt."show_id" = dptd."show_id";

UPDATE disney_plus_titles AS dmt 
    SET ("show_id", "titleXlistedin_id") = (dptd."show_id", dptd."id")
    FROM "disney_plus_titlesXlisted_in" AS dptd
    WHERE dmt."show_id" = dptd."show_id";

ALTER TABLE disney_plus_titles
    DROP COLUMN IF EXISTS "director",
    DROP COLUMN IF EXISTS "cast",
    DROP COLUMN IF EXISTS "listed_in";

SELECT *, CAST(SUBSTRING("show_id", 2) AS INTEGER) AS "ORDEM" FROM disney_plus_titles
ORDER BY "ORDEM"; -- showind results