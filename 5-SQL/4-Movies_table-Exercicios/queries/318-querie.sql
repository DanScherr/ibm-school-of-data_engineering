-- ATUALIZANDO A disney_plus_titles
ALTER TABLE disney_plus_titlesxdirectors
    ADD COLUMN IF NOT ExISTS "re_name" VARCHAR(50);


-- UPDATING VALUES
WITH instant AS (
    SELECT  "show_id",
        STRING_TO_ARRAY(r.name, ' '),
        array_length(STRING_TO_ARRAY(r.name, ' '), 1)
    FROM disney_plus_titlesXdirectors as r
), rename_table AS (
    SELECT  show_id,
            string_to_array["array_length"] 
            || ', ' 
            || string_to_array[1]
            AS re_name
FROM instant
)

--

UPDATE disney_plus_titlesxdirectors AS dpt
SET (
        "show_id",
        "re_name"
    ) = (
            r."show_id", r."re_name"
        )
FROM "rename_table" AS r

WHERE dpt."show_id" = r."show_id";

-- SHOW RESULTS
SELECT * FROM disney_plus_titlesxdirectors;