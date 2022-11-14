-----------------------------------------------------------------------
-- NORMZALIZING, CREATING AND POPULATING DISNEY MOVIE MOVIE TABLE --
-----------------------------------------------------------------------

-- DROP TABLE IN CASE IT DOESNT EXISTS
DROP TABLE IF EXISTS disney_movie_movie;

-- CREATE TABLE WITH AUTO INCREMENTAL PRIMARY KEY
CREATE TABLE IF NOT EXISTS public.disney_movie_movie
(
    "id" VARCHAR(10) NOT NULL PRIMARY KEY,
    "title" VARCHAR(80) DEFAULT NULL, -- REFERENCES public.disney_movie_movie,
    "date_added" VARCHAR(20) DEFAULT NULL, -- REFERENCES public.disney_movie_movie,
    "release_year" SMALLINT DEFAULT NULL,
    "rating" VARCHAR(10) DEFAULT NULL,
    "duration" VARCHAR(10) DEFAULT NULL,
    "description" VARCHAR(110) DEFAULT NULL
);

-- INSERT INTO TABLE VALUES FROM THE disney_plus_titles TYPE COLUMN
INSERT INTO 
    public.disney_movie_movie ("id", "title", "date_added", "release_year", "rating", "duration", "description")
        SELECT "show_id", "title", "date_added", "release_year", "rating", "duration", "description"
        FROM public.disney_plus_titles;

-- Returning values with SELECT statment
SELECT * FROM public.disney_movie_movie;