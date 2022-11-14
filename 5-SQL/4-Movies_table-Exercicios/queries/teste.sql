SELECT t.show_id as movie_id, d.id as director_id 
FROM public.disney_plus_titles as t
    LEFT JOIN public.disney_movie_director as d
    ON t.director = d.name
    ORDER BY cast(substring(t.show_id, 2) AS INTEGER);