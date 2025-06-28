SELECT 
    EXTRACT (year FROM release_date) AS release_year,
    COUNT(DISTINCT movie_id) AS movies_released
FROM {{ ref('dim_movies')}}
GROUP BY release_year
ORDER BY release_year ASC;
