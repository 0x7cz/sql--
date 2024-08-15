-- Write your PostgreSQL query statement below
SELECT user_id,count(1) as followers_count
FROM Followers
GROUP by 1
order by 1 