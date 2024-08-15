SELECT
'Low Salary' As category,
sum(case when income<20000 THEN 1 ELSE 0 END) as accounts_count 
FROM
Accounts
UNION 
SELECT
'Average Salary' As category,
sum(case when income>=20000 and income<=50000 THEN 1 ELSE 0 END) as accounts_count 
FROM
Accounts
UNION
SELECT
'High Salary' As category,
sum(case when income>50000 THEN 1 ELSE 0 END) as accounts_count 
FROM
Accounts



# Write your MySQL query statement below
SELECT a.category , IFNULL(accounts_count,0) as accounts_count
FROM
(
SELECT 'Low Salary' AS category
UNION
SELECT 'Average Salary'
UNION
SELECT 'High Salary') a
LEFT JOIN 
(SELECT CASE WHEN income<20000 THEN 'Low Salary'
            WHEN income Between 20000 AND 50000 THEN 'Average Salary'
            WHEN income>50000 THEN 'High Salary' END as category
            ,count(1) as accounts_count
FROM  Accounts 
GROUP BY category
) b
on a.category = b.category