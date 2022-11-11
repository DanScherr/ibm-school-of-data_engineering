-----------------------------------------------------------------------
-- NORMZALIZING, CREATING AND POPULATING DISNEY MOVIE CATEGORY TABLE --
-----------------------------------------------------------------------

-- DROP TABLE IN CASE IT DOESNT EXISTS
DROP TABLE IF EXISTS public.disney_movie_movieXdirector;

-- CREATE TABLE WITH AUTO INCREMENTAL PRIMARY KEY
CREATE TABLE IF NOT EXISTS public.disney_movie_movieXdirector
(
    "id" VARCHAR(10) NOT NULL PRIMARY KEY,
    "movie_id" VARCHAR(10) DEFAULT NULL, -- REFERENCES public.disney_movie_movieXdirector,
    "director_id" INTEGER DEFAULT NULL, -- REFERENCES public.disney_movie_movieXdirector,
    CONSTRAINT fk_movie 
        FOREIGN KEY(movie_id) 
            REFERENCES public.disney_movie_movie(id) 
                ON DELETE SET NULL,
    CONSTRAINT fk_director 
        FOREIGN KEY(director_id) 
            REFERENCES public.disney_movie_director(id) 
                ON DELETE SET NULL
);


WITH instant_title_id_director AS (
        SELECT show_id, TRIM(UNNEST(string_to_array(disney_plus_titles."director", ',', ' ,'))) AS "director" FROM disney_plus_titles
)
-- INSERT INTO TABLE VALUES FROM THE disney_plus_titles TYPE COLUMN
INSERT INTO 
    public.disney_movie_movieXdirector ("id", "movie_id", "director_id")
        SELECT d.id as id, i.show_id as CAST(movie_id), d.name as director_id FROM public.disney_movie_director as d
            JOIN instant_title_id_director as i
            ON d.name = i.director
            ORDER BY d.id;

-- Returning values with SELECT statment
SELECT * FROM public.disney_movie_movieXdirector;