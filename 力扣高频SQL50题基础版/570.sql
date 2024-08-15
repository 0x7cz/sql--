-- Write your PostgreSQL query statement below
SELECT  b.name
FROM Employee a
Inner JOIN Employee b 
ON a.managerId = b.id 
GROUP BY b.id,b.name
HAVING count(1)>=5
