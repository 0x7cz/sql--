with q1 as(
SELECT visited_on,sum(amount)  as amount
FROM Customer
GROUP BY visited_on   
),
 q2  as (
SELECT visited_on,
sum(amount) OVER (ORDER by visited_on ROWS  between 6 preceding and current row) as amount,
avg(amount) OVER (ORDER by visited_on ROWS  between 6 preceding and current row) as avg
FROM q1 
ORDER by visited_on 
)
SELECT visited_on,round(amount,2),round(avg,2)
FROM q2 
WHERE DATEDIFF(visited_on, (SELECT MIN(visited_on) FROM Customer)) >= 6
