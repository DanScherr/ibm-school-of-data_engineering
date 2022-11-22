-- FIRST FUNCTION

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



-- TESTING FUNCTION
SELECT getDay(2011);