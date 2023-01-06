SELECT 
    ROW_NUMBER(),
    "country"
FROM
    amazon_prime_titles
WHERE
    "country" != ''
GROUP BY 
    "country"
ORDER BY 
    "country"