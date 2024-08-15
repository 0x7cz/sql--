SELECT a.user_id
FROM
MovieRating a 
LEFT JOIN Users b
ON a.user_id = b.user_id
GROUP BY a.user_id
order by  count(1) desc ,a.user_id
UNION 
SELECT a.movie_id      
FROM
MovieRating a 
LEFT JOIN Movies b
ON a.movie_id = b.movie_id    
WHERE  to_char(created_at,'yyyy-MM') ='2020-02'
GROUP BY a.movie_id
order by  avg(rating) desc ,a.movie_id      
    