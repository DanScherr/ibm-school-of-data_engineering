-- FIRST FUNCTION --

-- DROP FUNCTION IF EXISTS
DROP FUNCTION IF EXISTS getDay;

-- CREATE FUNCTION
CREATE FUNCTION getDay(val INTEGER) RETURNS INTEGER -- def of function

LANGUAGE PLPGSQL AS $$ -- start of plpgsql language
    
    DECLARE -- declaring varibles
        day INTEGER; -- same type as day
    
    BEGIN -- logic
        SELECT val/100 INTO day;
        
        RETURN day;
    END;

$$; -- end of language option

-- SECOND FUNCTION --

-- DROP FUNCTION IF EXISTS
DROP FUNCTION IF EXISTS getMonth;

-- CREATE FUNCTION
CREATE FUNCTION getMonth(val INTEGER) RETURNS INTEGER -- def of function

LANGUAGE PLPGSQL AS $$ -- start of plpgsql language
    
    DECLARE -- declaring varibles
        month INTEGER; -- same type as day
    
    BEGIN -- logic
        SELECT val%100 INTO month;
        
        RETURN month;
    END;

$$; -- end of language option



-- THIRD FUNCTION --

-- DROP FUNCTION IF EXISTS
DROP FUNCTION IF EXISTS movie_birthday;

-- CREATE FUNCTION
CREATE FUNCTION movie_birthday(date_usr INTEGER, option INTEGER, conteudo VARCHAR) RETURNS TABLE(title VARCHAR) -- def of function

LANGUAGE PLPGSQL AS $$ -- start of plpgsql language

    BEGIN -- logic

        RETURN QUERY
            SELECT r.title
            FROM date_table AS l

            JOIN streamers_titles AS r
            ON l.show_id = r.show_id 

            WHERE   l.day = getDay(date_usr)
                    AND l.month = getMonth(date_usr)
                    AND r.stars >=3
                    AND r.type = conteudo
        LIMIT 1
        OFFSET option;

    END;

$$; -- end of language option


-- TESTING FUNCTION
SELECT *
FROM movie_birthday(1511, 0, 'Movie') -- change the second parameter to select different option of movie