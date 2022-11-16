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

-- titleXdirector_id column
UPDATE disney_plus_titles AS dpt
SET "titleXdirector_id" = 
    (CASE   WHEN subquery."titleXdirector_id" = NULL
            THEN NULL
            ELSE subquery."titleXdirector_id"
    END)
    FROM disney_plus_titles AS subquery
WHERE dpt."show_id" = subquery."show_id";

-- titleXcast_id column
UPDATE disney_plus_titles AS dpt
SET "titleXcast_id" = 
    (CASE   WHEN subquery."titleXcast_id" = NULL
            THEN NULL
            ELSE subquery."titleXcast_id"
    END)
    FROM disney_plus_titles AS subquery
WHERE dpt."show_id" = subquery."show_id";

-- titleXlistedin_id column
UPDATE disney_plus_titles AS dpt
SET "titleXlistedin_id" =
    (CASE   WHEN subquery."titleXlistedin_id" = NULL
            THEN NULL
            ELSE subquery."titleXlistedin_id"
    END)
    FROM disney_plus_titles AS subquery
WHERE dpt."show_id" = subquery."show_id";