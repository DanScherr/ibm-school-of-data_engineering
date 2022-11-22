-- query 5

SELECT DISTINCT l."title"
FROM streamers_titles as l
JOIN time_table as r
    ON l."show_id" = r."show_id"
WHERE
    l."type" = 'TV Show'
    AND r."hours" >= 30;