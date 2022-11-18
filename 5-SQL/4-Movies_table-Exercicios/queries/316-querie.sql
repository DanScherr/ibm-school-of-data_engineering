SELECT COUNT(DISTINCT r."show_id")
FROM disney_plus_titlesxcountry as l
JOIN disney_plus_titles as r
ON l."show_id" = r."show_id"
WHERE
    l."name" LIKE 'Canada'
    AND r."type" = 'Movie';