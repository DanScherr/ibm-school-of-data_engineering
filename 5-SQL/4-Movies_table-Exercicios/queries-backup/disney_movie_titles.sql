-- DROP TABLE IF EXISTS
DROP TABLE IF EXISTS disney_movie_titles;

-- CREATE TABLE IF NOT EXISTS
CREATE TABLE IF NOT EXISTS disney_movie_titles
(
    "id" SERIAL UNIQUE NOT NULL PRIMARY KEY,
    "type_id" SMALLINT,
    "director_id" SMALLINT,
    "movieXcast_id" SMALLINT,
    "pais_id" SMALLINT,
    "movieXdirector_id" SMALLINT
);

-- INSERT INTO TABLE
WITH instant_t AS (
    SELECT 
        "show_id",
        "type",
        TRIM(UNNEST(string_to_array(t."cast", ',', ' ,'))) AS "cast",
        "country",
        TRIM(UNNEST(string_to_array(t."rating", ',', ' ,'))) AS "rating",
        TRIM(UNNEST(string_to_array(t."listed_in", ',', ' ,'))) AS "listed_in"
    FROM disney_plus_titles as t
)

SELECT * FROM instant_t

-- 
INSERT INTO disney_movie_titles ("type_id", "director_id", "movieXcast_id", "pais_id", "movieXdirector")
SELECT "type_id", "director_id", "movieXcast_id", "pais_id", "movieXdirector"
FROM disney_movie_movieXtitle AS mt

JOIN disney_movie_movie as m
ON mt.movie_id
--

-- ultima tentativa de unificacao
WITH instant_t AS (
    SELECT 
        "show_id",
        TRIM(UNNEST(string_to_array(t."director", ',', ' ,'))) AS "director",
        TRIM(UNNEST(string_to_array(t."cast", ',', ' ,'))) AS "cast",
        "country",
        TRIM(UNNEST(string_to_array(t."rating", ',', ' ,'))) AS "rating",
        TRIM(UNNEST(string_to_array(t."listed_in", ',', ' ,'))) AS "listed_in"
    FROM disney_plus_titles as t
)

SELECT 
    md.id as movieXdirector_id,
    d.id as movie_id,
    cas.id as cast_id,
    p.id as pais_id,
    r.id as rating_id,
    cat.id as category_id

FROM instant_t as it

LEFT JOIN disney_movie_movieXdirector as md
ON it.show_id = md.movie_id

LEFT JOIN disney_movie_director as d
ON it."director" = d."name"

LEFT JOIN disney_movie_cast as cas
ON it."cast" = cas."name"

LEFT JOIN pais as p
ON it."country" = p."name"

LEFT JOIN disney_movie_rating as r
ON it."rating" = r."name"

LEFT JOIN disney_movie_category as cat
ON it."listed_in" = cat."name";