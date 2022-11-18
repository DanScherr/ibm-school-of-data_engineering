-- SOLUTION
SELECT ROUND(AVG(d."minutes"), 2)
FROM disney_plus_titles as l
JOIN "time_table" as d
ON l."show_id" = d."show_id"
WHERE "type" = 'TV Show'