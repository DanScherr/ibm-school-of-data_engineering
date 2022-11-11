-----------------------------------------------------------------------
-- NORMZALIZING, CREATING AND POPULATING DISNEY MOVIE CATEGORY TABLE --
-----------------------------------------------------------------------

-- DROP TABLE IN CASE IT DOESNT EXISTS
DROP TABLE IF EXISTS disney_movie_director;

-- CREATE TABLE WITH AUTO INCREMENTAL PRIMARY KEY
CREATE TABLE IF NOT EXISTS public.disney_movie_director
(
    "id" VARCHAR(10 )SERIAL NOT NULL UNIQUE PRIMARY KEY,
    "name" VARCHAR(50) NOT NULL
);

-- INSERT INTO TABLE VALUES FROM THE disney_plus_titles TYPE COLUMN
INSERT INTO 
    public.disney_movie_director AS dmt ("name")
        SELECT DISTINCT TRIM(UNNEST(string_to_array(disney_plus_titles."director", ',', ' ,'))) AS "director"
        FROM public.disney_plus_titles
            WHERE "director" IS NOT NULL
            ORDER BY "director";

-- Returning values with SELECT statment
SELECT * FROM public.disney_movie_director;