SELECT 
    COUNT("country"),
    "country"
FROM
    amazon_prime_titles
WHERE
    "country" != ''
GROUP BY 
    "country"
ORDER BY 
    "country"