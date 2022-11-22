WITH instant_table AS (
    SELECT  mt.id, 
            mt.movie_id, 
            mt.director_id, 
            TRIM(UNNEST(STRING_TO_ARRAY(t."cast", ',', ', '))) AS "cast", 
            t.country, 
            TRIM(UNNEST(STRING_TO_ARRAY(t."listed_in", ',', ', '))) AS "listed_in",
            TRIM(UNNEST(STRING_TO_ARRAY(t."rating", ',', ', '))) AS "rating"

    FROM disney_movie_movieXdirector as mt
    JOIN disney_plus_titles as t
    ON mt."movie_id" = t."show_id"
)
SELECT * FROM instant_table as it
LEFT JOIN disney_movie_cast as c
ON it."cast" = c."name"

LEFT JOIN pais AS p
ON it."country" = p."name"

LEFT JOIN disney_movie_category AS cat
ON it."listed_in" = cat."name";

-- TRIM(UNNEST(string_to_array(disney_plus_titles."listed_in", ',', ' ,'))) AS "listed_in"