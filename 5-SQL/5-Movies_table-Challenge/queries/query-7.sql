-- query-7

-- CREATING COLUMN ON streamers_titles --
ALTER TABLE streamers_titles
ADD IF NOT EXISTS "stars" SMALLINT;



-- UPDATING NEW COLUMN VALUES --
-- INSTANT TABLES --
-- qtd de elenco por titulo
WITH qtd_cast AS (
    SELECT 
        show_id,
        count("name") AS qtd_cast
    FROM 
        streamers_titlesxcast
    GROUP BY
        show_id
    ORDER BY
        qtd_cast DESC
),
-- cast stars
instant_cast AS (
SELECT  show_id,
        CASE
            WHEN qtd_cast >= 3
                THEN 1
                ELSE 0
        END AS cast_stars
FROM qtd_cast
),
-- qtd de diretores
qtd_directors AS (
    SELECT  show_id, 
            count("name") as qtd_directors
    FROM streamers_titlesxdirectors
    GROUP BY show_id
),
-- directors stars
instant_directors AS (
        SELECT 
            show_id,
            CASE
                WHEN    "qtd_directors" = 1 OR
                        "qtd_directors" = 2
                    THEN 1
                    ELSE 0
            END AS directors_stars
        FROM 
            qtd_directors
),
-- pais de produção
instant_country AS (
    SELECT
        show_id,
        CASE
            WHEN    "name" = 'United States' OR
                    "name" = 'France'
                THEN 1
            WHEN    "name" = 'United States' AND
                    "name" = 'France'
                THEN 2
                ELSE 0
        END as country_stars
    FROM streamers_titlesxcountry
),
instant_time AS (
    SELECT
        show_id,
        CASE
            WHEN    "minutes" >= 120
                THEN 1
                ELSE 0
        END as time_stars
    FROM time_table
),

-- ANALYTICAL TABLE --
analytical AS (
    SELECT  l.show_id, l.type,
            ar.cast_stars,
            br.directors_stars,
            cr.country_stars,
            dr.time_stars
    FROM streamers_titles as l

    JOIN instant_cast as ar
    ON l.show_id = ar.show_id

    JOIN instant_directors as br
    ON l.show_id = br.show_id

    JOIN instant_country as cr
    ON l.show_id = cr.show_id

    JOIN instant_time as dr
    ON l.show_id = dr.show_id
)

-- FINAL TABLE, SUM OF STARS
-- UPDATING WITH VALUES
UPDATE streamers_titles
SET "stars" = subquery."stars"
FROM
(
    SELECT  analytical.show_id,
            cast_stars 
            + directors_stars
            + country_stars
            + time_stars AS stars
    FROM
        analytical
) AS subquery
WHERE
    streamers_titles.show_id = subquery.show_id;

-- REPLACING NULL WITH 0'S
UPDATE streamers_titles
SET 
    "stars" = 0
WHERE
    stars IS NULL;