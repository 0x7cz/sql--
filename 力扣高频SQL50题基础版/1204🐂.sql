SELECT a.person_name 
FROM Queue a 
LEFT JOIN Queue b
on 1=1
WHERE a.turn>=b.turn
GROUP BY a.person_name,a.turn
HAVING sum(b.weight)<=1000  
order by a.turn  desc
limit 1

SELECT person_name 
FROM
(
SELECT person_name,turn,
sum(weight) over(order by turn ) a
FROM Queue) c
WHERE  a<=1000 
order by turn desc  
LIMIT 1