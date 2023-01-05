SELECT
    RANK() OVER(ORDER BY "country" ASC) AS overe_index,
    title
FROM 
    amazon_prime_titles
WHERE
    "country" is not NULL
