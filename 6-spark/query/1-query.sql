SELECT
    MAX("release_year") OVER(PARTITION BY "country") AS MAX,
    MIN("release_year") OVER(PARTITION BY "country") AS MIN,
    "country"
FROM 
    amazon_prime_titles
WHERE
    "country" != ''


--------------------------------------------------------------------
----------------------------- LAG () -------------------------------
--------------------------------------------------------------------

SELECT
    LAG("release_year", 1,0) OVER(PARTITION BY "country") AS previous_year,
    "release_year" as current_year,
    LEAD("release_year", 1,0) OVER(PARTITION BY "country") next_year,
    "country"
FROM 
    amazon_prime_titles
WHERE
    "country" != ''
