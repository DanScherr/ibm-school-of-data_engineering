-- DROP TABLE IF EXISTS
DROP TABLE IF EXISTS disney_movie_cast;

-- CREATE TABLE IF NOT EXISTS
CREATE TABLE IF NOT EXISTS disney_movie_cast
(
    "id" SERIAL UNIQUE NOT NULL PRIMARY KEY,
    "name" VARCHAR(120)
);

-- INSERT INTO TABLE
INSERT INTO 
    disney_movie_cast  AS dmt ("name")
        SELECT DISTINCT TRIM(UNNEST(string_to_array(disney_plus_titles."cast", ',', ' ,'))) AS "cast"
        FROM disney_plus_titles
            WHERE "cast" IS NOT NULL
            ORDER BY "cast";

-- SHOW RESULTS
SELECT * FROM disney_movie_cast;