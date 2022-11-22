-- FIRST FUNCTION

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



-- TESTING FUNCTION
SELECT getMonth(2011);