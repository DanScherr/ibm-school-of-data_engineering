-- DROP TABLE IF EXISTS
DROP TABLE IF EXISTS public.pais;

-- CREATE TABLE IF NOT EXTIST
CREATE TABLE IF NOT EXISTS public.pais 
(
    "id" SERIAL NOT NULL UNIQUE PRIMARY KEY,
    "name" VARCHAR(140)
);

-- INSERT INTO TABLE VALUES FROM dinsey_plus_titles
INSERT INTO 
    public.pais AS dmt ("name")
        SELECT DISTINCT TRIM(UNNEST(string_to_array(disney_plus_titles."country", ',', ', '))) as "name" 
        FROM disney_plus_titles
            ORDER BY "name";

-- SHOWING RESULTS
SELECT * FROM public.pais;
