-----------------------------------------------------------------------
-- NORMZALIZING, CREATING AND POPULATING DISNEY MOVIE CATEGORY TABLE --
-----------------------------------------------------------------------

-- DROP TABLE IN CASE IT DOESNT EXISTS
DROP TABLE IF EXISTS public.disney_movie_movieXcast;

-- CREATE TABLE WITH AUTO INCREMENTAL PRIMARY KEY
CREATE TABLE IF NOT EXISTS public.disney_movie_movieXcast
(
    "id" SERIAL NOT NULL PRIMARY KEY,
    "movie_id" VARCHAR(10) DEFAULT NULL, -- REFERENCES public.disney_movie_movieXcast,
    "cast_id" INTEGER DEFAULT NULL, -- REFERENCES public.disney_movie_movieXcast,
    CONSTRAINT fk_movie 
        FOREIGN KEY(movie_id) 
            REFERENCES public.disney_movie_movie(id) 
                ON DELETE SET NULL,
    CONSTRAINT fk_cast 
        FOREIGN KEY(cast_id) 
            REFERENCES public.disney_movie_cast(id) 
                ON DELETE SET NULL
);

WITH instant_disney_plus_titles AS (
    SELECT show_id, TRIM(UNNEST(string_to_array(disney_plus_titles."cast", ',', ' ,'))) AS "cast"
    FROM public.disney_plus_titles
)
-- INSERT INTO TABLE VALUES FROM THE disney_plus_titles TYPE COLUMN
INSERT INTO 
    public.disney_movie_movieXcast ("movie_id", "cast_id")

        SELECT t.show_id as movie_id, c.id as cast_id 
        FROM instant_disney_plus_titles as t
            LEFT JOIN public.disney_movie_cast as c
            ON t.cast = c.name
            ORDER BY cast(substring(t.show_id, 2) AS INTEGER);

-- Returning values with SELECT statment
SELECT * FROM public.disney_movie_movieXcast;