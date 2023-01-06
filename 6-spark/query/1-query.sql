SELECT
    MAX("duration") OVER(PARTITION BY "country") AS over_partition_index,
    MIN("duration") OVER(PARTITION BY "country") AS over_partition_index,
    "country"
FROM 
    amazon_prime_titles
WHERE
    "country" != ''
