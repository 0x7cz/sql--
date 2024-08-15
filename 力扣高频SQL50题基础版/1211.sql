SELECT 
query_name,
round(avg(rating/Cast(position as NUMERIC)),2) as quality ,
round(sum(case when rating<3 THEN 1 ELSE 0 END)/Cast(count(1) as NUMERIC)*100,2) as poor_query_percentage 
FROM Queries a
Where query_name IS NOT NULL

GROUP BY query_name  