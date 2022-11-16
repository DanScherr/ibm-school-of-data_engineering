-- DROP TABLE IF EXISTS
DROP TABLE IF EXISTS disney_movie_rating;

-- CREATE TABLE IF NOT EXISTS
CREATE TABLE IF NOT EXISTS disney_movie_rating
(
    "id" SERIAL UNIQUE NOT NULL PRIMARY KEY,
    "name" VARCHAR(10)
);

-- INSERT INTO TABLE

WITH instant_table AS (
    SELECT DISTINCT TRIM(UNNEST(STRING_TO_ARRAY(disney_plus_titles."rating", ',', ', '))) AS "rating"
    FROM disney_plus_titles
)

INSERT INTO 
    disney_movie_rating  AS dmt ("name")
        SELECT * FROM instant_table
            WHERE "rating" IS NOT NULL
            ORDER BY "rating";

-- SHOW RESULTS
SELECT * FROM disney_movie_rating;