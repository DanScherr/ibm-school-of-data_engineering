-- SOLUTION
WITH instant AS (
    SELECT *
    FROM disney_plus_titles as l
    JOIN "time_table" as r
    ON l."show_id" = r."show_id"
    WHERE "type" = 'TV Show'
)

SELECT *
FROM disney_plus_titles as l
JOIN "time_table" as d
ON l."show_id" = d."show_id"
WHERE "minutes" IN (
    SELECT MAX("minutes")
    FROM instant
);
