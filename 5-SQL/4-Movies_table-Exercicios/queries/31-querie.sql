-- NAN

-- type column
UPDATE disney_plus_titles AS dpt
SET "type" = 
    (CASE   WHEN subquery."type" = ''
            THEN 'NAN'
            ELSE subquery."type"
    END)
    FROM disney_plus_titles AS subquery
WHERE dpt."show_id" = subquery."show_id";

-- title column
UPDATE disney_plus_titles AS dpt
SET "title" = 
    (CASE   WHEN subquery."title" = ''
            THEN 'NAN'
            ELSE subquery."title"
    END)
    FROM disney_plus_titles AS subquery
WHERE dpt."show_id" = subquery."show_id";

-- country column
UPDATE disney_plus_titles AS dpt
SET "country" = 
    (CASE   WHEN subquery."country" = ''
            THEN 'NAN'
            ELSE subquery."country"
    END)
    FROM disney_plus_titles AS subquery
WHERE dpt."show_id" = subquery."show_id";