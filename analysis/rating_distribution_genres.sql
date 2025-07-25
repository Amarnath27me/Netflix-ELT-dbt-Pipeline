---Analysis: Rating Distribution Across Genres
SELECT 
    genre,
    AVG(rating) AS avg_rating,
    COUNT(DISTINCT movie_id) AS total_movies
FROM {{ref('dim_genome_tags')}} m
JOIN {{(ref('fct_ratings'))}} r ON m.movie_id = r.movie_id
CROSS JOIN UNNEST(m.genre_array) AS genre
GROUP BY genre
ORDER BY average_rating DESC;
