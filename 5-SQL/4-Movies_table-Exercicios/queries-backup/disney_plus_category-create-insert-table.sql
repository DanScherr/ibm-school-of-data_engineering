-----------------------------------------------------------------------
-- NORMZALIZING, CREATING AND POPULATING DISNEY MOVIE CATEGORY TABLE --
-----------------------------------------------------------------------

-- DROP TABLE IN CASE IT DOESNT EXISTS
DROP TABLE IF EXISTS disney_movie_category;

-- CREATE TABLE WITH AUTO INCREMENTAL PRIMARY KEY
CREATE TABLE IF NOT EXISTS public.disney_movie_category
(
    "id" SERIAL NOT NULL UNIQUE PRIMARY KEY,
    "name" VARCHAR(50) NOT NULL
);

-- INSERT INTO TABLE VALUES FROM THE disney_plus_titles TYPE COLUMN
INSERT INTO 
    public.disney_movie_category AS dmt ("name")
        SELECT DISTINCT TRIM(UNNEST(string_to_array(disney_plus_titles."listed_in", ',', ' ,'))) AS "listed_in"
        FROM public.disney_plus_titles
            WHERE "listed_in" IS NOT NULL
            ORDER BY "listed_in";

-- Returning values with SELECT statment
SELECT * FROM public.disney_movie_category;