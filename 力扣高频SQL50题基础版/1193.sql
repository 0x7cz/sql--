-- Write your PostgreSQL query statement below
SELECT to_char(trans_date,'YYYY-MM') as month,
country ,
count(1) trans_count , 
sum(CASE WHEN state='approved' THEN 1 ELSE 0 END) approved_count ,
sum(amount) trans_total_amount , 
sum(CASE WHEN state='approved' THEN amount   ELSE 0 END) approved_total_amount 
FROM Transactions
GROUP BY 1,2
