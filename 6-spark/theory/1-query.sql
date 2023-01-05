SELECT
    COUNT("country") OVER(PARTITION BY "country") AS overe_index,
    "country"
FROM 
    amazon_prime_titles
WHERE
    "country" != ''
