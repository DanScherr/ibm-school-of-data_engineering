-- DROPING SEQUENCE IF EXISTS
DROP SEQUENCE IF EXISTS serial_stars;

-- CREATING SEQUENCE
CREATE SEQUENCE IF NOT EXISTS serial_stars START 1;

-- DROP COLUMN IF NEEDED
--ALTER TABLE streamers_titles
--DROP IF EXISTS "ranking";

-- CREATING COLUMN ON streamers_titles --
ALTER TABLE streamers_titles
ADD IF NOT EXISTS "ranking" VARCHAR(100);


-- ADDING COLUMN WITH ORDERED SUBQUERY
WITH instat_date AS(
    SELECT  show_id,
            CASE    WHEN iso_date_1 IS NULL
                        THEN '2013-01-01'::date
                        ELSE iso_date_1
            END as iso_date_1
    FROM
        date_table
)

UPDATE streamers_titles AS l
SET "ranking" = subquery."ranking"
FROM
(
    SELECT  l.show_id,
            l.type,
            l.stars,
            fr.iso_date_1,
            nextval('serial_stars')::VARCHAR || '_m' AS ranking
FROM
    streamers_titles as l

JOIN instat_date as fr
ON l.show_id = fr.show_id

WHERE
    l.type = 'Movie'

ORDER BY
    L.stars DESC, fr.iso_date_1 DESC
) AS subquery

WHERE 
    l.show_id = subquery."show_id";