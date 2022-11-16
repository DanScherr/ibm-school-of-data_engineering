--------------------------------------------------------------------
-- NORMZALIZING, CREATING AND POPULATING DISNEY MOVIE TYPES TABLE --
--------------------------------------------------------------------

-- DROP TABLE IN CASE IT DOESNT EXISTS
DROP TABLE IF EXISTS disney_movie_type;

-- CREATE TABLE WITH AUTO INCREMENTAL PRIMARY KEY
CREATE TABLE IF NOT EXISTS public.disney_movie_type
(
    "id" SERIAL NOT NULL UNIQUE PRIMARY KEY,
    "type" VARCHAR(10) NOT NULL
);

-- INSERT INTO TABLE VALUES FROM THE disney_plus_titles TYPE COLUMN
INSERT INTO 
    public.disney_movie_type AS dmt ("type")
        SELECT "type" FROM public.disney_plus_titles
            WHERE "type" IS NOT NULL
            GROUP BY "type"
            ORDER BY "type";

-- Returning values with SELECT statment
SELECT * FROM public.disney_movie_type;