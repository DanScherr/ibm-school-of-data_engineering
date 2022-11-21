-- query-6



WITH instant AS 
(
    SELECT DISTINCT     l."show_id",
                        CASE 
                            WHEN fr."name" LIKE '%Action%' AND fr."name" LIKE '%Adventure%'
                                THEN 'Action and Adventure'
                            WHEN fr."name" LIKE 'Anime%'
                                THEN 'Anime'
                            WHEN fr."name" LIKE 'Classic%'
                                THEN 'Classic'
                            WHEN fr."name" LIKE 'Crime%'
                                THEN 'Crime'
                            WHEN fr."name" LIKE 'Docu%'
                                THEN 'Documentarie'
                            WHEN fr."name" LIKE 'Drama%'
                                THEN 'Drama'
                            WHEN fr."name" LIKE 'Faith%'
                                THEN 'Faith'
                            WHEN fr."name" LIKE 'Horror%'
                                THEN 'Horror'
                            WHEN fr."name" LIKE 'International%'
                                THEN 'International'
                            WHEN fr."name" LIKE 'LGBTQ%'
                                THEN 'LGBTQIA+'
                            WHEN fr."name" LIKE 'Music%' AND fr."name" NOT LIKE 'Musical%'
                                THEN 'Music'
                            WHEN fr."name" LIKE 'Reality%'
                                THEN 'Reality'
                            WHEN fr."name" LIKE 'Romant%'
                                THEN 'Romance'
                            WHEN fr."name" LIKE '%Sci%' AND fr."name" NOT LIKE 'Science & Nature TV'
                                THEN 'Science and Fiction'
                            WHEN fr."name" LIKE 'Sports%'
                                THEN 'Sports'
                            WHEN fr."name" LIKE 'Talk Show%'
                                THEN 'Talk Show'
                            WHEN fr."name" LIKE '%Thriller%'
                                THEN 'Thriller'
                            ELSE
                                fr."name"
                        END
    FROM streamers_titles as l
    JOIN streamers_titlesxlisted_in as fr
    ON l."show_id" = fr."show_id"
)

SELECT DISTINCT "name", 
                SUM("minutes")
FROM streamers_titles as l
JOIN instant as fr
    ON l."show_id" = fr."show_id"
JOIN time_table as sr
    ON l."show_id" = sr."show_id"
WHERE
    l."type" = 'Movie'
GROUP BY
    fr."name"
ORDER BY
    fr."name"