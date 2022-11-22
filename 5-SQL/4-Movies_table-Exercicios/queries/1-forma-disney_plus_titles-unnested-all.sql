SELECT 
        "show_id",
        "type",
        "title",
        TRIM(UNNEST(string_to_array(t."director", ',', ' ,'))) AS "director",
        TRIM(UNNEST(string_to_array(t."cast", ',', ' ,'))) AS "cast",
        "country",
        "date_added",
        "release_year",
        "rating",
        "duration",
        TRIM(UNNEST(string_to_array(t."listed_in", ',', ' ,'))) AS "listed_in",
        "description"
FROM disney_plus_titles as t;