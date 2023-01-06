SELECT
    COUNT("country") OVER(ORDER BY "country" ASC) AS over_orderby_index,
    "country"
FROM 
    amazon_prime_titles
WHERE
    "country" != ''