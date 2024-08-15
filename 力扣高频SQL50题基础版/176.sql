SELECT a.salary SecondHighestSalary 
FROM Employee a
LEFT JOIN Employee b
ON a.salary<b.salary
GROUP BY a.id,a.salary 
HAVING count(b.id)=1


# Write your MySQL query statement below
SELECT   MAX(SALARY) AS SecondHighestSalary
FROM EMPLOYEE
WHERE SALARY != (SELECT MAX(SALARY) FROM EMPLOYEE)
