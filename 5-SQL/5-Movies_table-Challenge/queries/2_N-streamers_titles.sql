-- Para passarmos para a segunda forma normal os registros na tabela, que não são chaves,
-- devem depender da chave primária em sua totalidade e não apenas parte dela.
---------------------------------------------------------------------------------------------

-- CREATE director
DROP TABLE IF ExISTS "streamers_titlesxdirectors";

CREATE TABLE IF NOT ExISTS "streamers_titlesxdirectors"
(
    "show_id" INTEGER NOT NULL ,
    "name" VARCHAR(1500) NOT NULL,
    PRIMARY KEY ("show_id", "name"),
    CONSTRAINT fk_show_id 
        FOREIGN KEY ("show_id")
            REFERENCES streamers_titles("show_id")
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

WITH "instant_table" AS (
    SELECT 
        "show_id",
        TRIM(UNNEST(string_to_array(t."director", ',', ' ,'))) AS "director"
    FROM "streamers_titles" as t
)
INSERT INTO "streamers_titlesxdirectors" AS dmt ("show_id", "name")
    SELECT DISTINCT "show_id", "director"
    FROM "instant_table"
        WHERE "director" IS NOT NULL AND "director" != '1' 
        ORDER BY "director";

ALTER TABLE streamers_titles
DROP COLUMN IF EXISTS "director";

SELECT * FROM "streamers_titlesxdirectors"; -- percebe-se uma relação de nxm
    

-- CREATE cast
DROP TABLE IF ExISTS "streamers_titlesxcast";

CREATE TABLE IF NOT ExISTS "streamers_titlesxcast"
(
    "show_id" INTEGER NOT NULL,
    "name" VARCHAR(120) NOT NULL,
    PRIMARY KEY ("show_id", "name"),
    CONSTRAINT fk_show_id 
        FOREIGN KEY ("show_id")
            REFERENCES streamers_titles("show_id")
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

WITH "instant_table" AS (
    SELECT 
        "show_id",
        TRIM(UNNEST(string_to_array(t."cast", ',', ' ,'))) AS "cast"
    FROM "streamers_titles" as t
)
INSERT INTO "streamers_titlesxcast" AS dmt ("show_id", "name")
    SELECT DISTINCT "show_id", "cast"
    FROM "instant_table"
        WHERE "cast" IS NOT NULL AND "cast" != '1' AND "cast"!= '' AND "cast"!= '2' AND "cast"!= '3'
        ORDER BY "cast";

ALTER TABLE streamers_titles
DROP COLUMN IF EXISTS "cast";

SELECT * FROM "streamers_titlesxcast"; -- percebe-se uma relação de nxm


-- CREATE listed_in
DROP TABLE IF ExISTS "streamers_titlesxlisted_in";

CREATE TABLE IF NOT ExISTS "streamers_titlesxlisted_in"
(
    "show_id" INTEGER NOT NULL,
    "name" VARCHAR(120) NOT NULL,
    PRIMARY KEY ("show_id", "name"),
    CONSTRAINT fk_show_id 
        FOREIGN KEY ("show_id")
            REFERENCES streamers_titles("show_id")
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

WITH "instant_table" AS (
    SELECT 
        "show_id",
        TRIM(UNNEST(string_to_array(t."listed_in", ',', ' ,'))) AS "listed_in"
    FROM "streamers_titles" as t
)
INSERT INTO "streamers_titlesxlisted_in" AS dmt ("show_id", "name")
    SELECT DISTINCT "show_id", 
                    CASE
                    WHEN fr."name" LIKE '%Action%' AND fr."name" LIKE '%Adventure%'
                        THEN 'Action and Adventure'
                    WHEN fr."name" LIKE 'Anime%'
                        THEN 'Anime'
                    WHEN fr."name" LIKE 'Classic%'
                        THEN 'Classic'
                    WHEN fr."name" LIKE 'Crime%'
                        THEN 'Crime'
                    WHEN fr."name" LIKE 'Docu%'
                        THEN 'Documentarie'
                    WHEN fr."name" LIKE 'Drama%'
                        THEN 'Drama'
                    WHEN fr."name" LIKE 'Faith%'
                        THEN 'Faith'
                    WHEN fr."name" LIKE 'Horror%'
                        THEN 'Horror'
                    WHEN fr."name" LIKE 'International%'
                        THEN 'International'
                    WHEN fr."name" LIKE 'LGBTQ%'
                        THEN 'LGBTQIA+'
                    WHEN fr."name" LIKE 'Music%' AND fr."name" NOT LIKE 'Musical%'
                        THEN 'Music'
                    WHEN fr."name" LIKE 'Reality%'
                        THEN 'Reality'
                    WHEN fr."name" LIKE 'Romant%'
                        THEN 'Romance'
                    WHEN fr."name" LIKE '%Sci%' AND fr."name" NOT LIKE 'Science & Nature TV'
                        THEN 'Science and Fiction'
                    WHEN fr."name" LIKE 'Sports%'
                        THEN 'Sports'
                    WHEN fr."name" LIKE 'Talk Show%'
                        THEN 'Talk Show'
                    WHEN fr."name" LIKE '%Thriller%'
                        THEN 'Thriller'
                    ELSE
                        fr."name"
                END AS listed_in
    FROM "instant_table"
        WHERE "listed_in" IS NOT NULL
        ORDER BY "listed_in";

ALTER TABLE streamers_titles
DROP COLUMN IF EXISTS "director";

SELECT * FROM "streamers_titlesxlisted_in"; -- percebe-se uma relação de nxm

-- CREATE country
DROP TABLE IF ExISTS "streamers_titlesxcountry";

CREATE TABLE IF NOT ExISTS "streamers_titlesxcountry"
(
    "show_id" INTEGER NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    PRIMARY KEY ("show_id", "name"),
    CONSTRAINT fk_show_id 
        FOREIGN KEY ("show_id")
            REFERENCES streamers_titles("show_id")
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

WITH "instant_table" AS (
    SELECT 
        "show_id",
        TRIM(UNNEST(string_to_array(t."country", ',', ' ,'))) AS "country"
    FROM "streamers_titles" as t
)
INSERT INTO "streamers_titlesxcountry" AS dmt ("show_id", "name")
    SELECT DISTINCT "show_id", "country"
    FROM "instant_table"
        WHERE "country" IS NOT NULL AND "country" != ''
        ORDER BY "country";

ALTER TABLE streamers_titles
DROP COLUMN IF EXISTS "country";

SELECT * FROM "streamers_titlesxcountry";

