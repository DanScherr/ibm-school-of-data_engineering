SELECT  name,
        COUNT(DISTINCT "show_id")
FROM disney_plus_titlesxcountry
WHERE "name" != 'NAN'
GROUP BY name
ORDER BY count DESC;