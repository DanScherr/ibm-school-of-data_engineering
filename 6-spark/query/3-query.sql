SELECT
    MAX("release_year") OVER(ORDER BY "country") AS MAX,
    MIN("release_year") OVER(ORDER BY "country") AS MIN,
    "country"
FROM 
    amazon_prime_titles
WHERE
    "country" != ''

--------------------------------------------------------------------
----------------------------- LAG () -------------------------------
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