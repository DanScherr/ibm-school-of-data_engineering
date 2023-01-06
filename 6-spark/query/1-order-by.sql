--------------------------------------------------------------------
-------------------------- CLASSIFICACAO ---------------------------
--------------------------------------------------------------------

----------------------------- RANK ---------------------------------

SELECT
    RANK() OVER(ORDER BY "country") AS over_parition_index,
    "country"
FROM 
    amazon_prime_titles
WHERE
    "country" != ''

----------------------------- RANK ---------------------------------

SELECT
    ROW_NUMBER() OVER(ORDER BY "country") AS over_parition_index,
    "country"
FROM 
    amazon_prime_titles
WHERE
    "country" != ''

--------------------------------------------------------------------
---------------------------- AGREGACAO -----------------------------
--------------------------------------------------------------------

SELECT
    MAX("release_year") OVER(ORDER BY "country") AS MAX,
    MIN("release_year") OVER(ORDER BY "country") AS MIN,
    "country"
FROM 
    amazon_prime_titles
WHERE
    "country" != ''

--------------------------------------------------------------------
--------------------------- ANALITICAS -----------------------------
--------------------------------------------------------------------

SELECT
    LAG("release_year", 1,0) OVER(ORDER BY "country") AS previous_year,
    "release_year" as current_year,
    LEAD("release_year", 1,0) OVER(ORDER BY "country") AS next_year,
    "country"
FROM 
    amazon_prime_titles
WHERE
    "country" != ''