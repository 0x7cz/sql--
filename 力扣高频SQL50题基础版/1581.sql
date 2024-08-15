SELECT  b.customer_id , count(1) as count_no_trans
FROM Transactions a 
RIGHT JOIN Visits b 
on a.visit_id=b.visit_id
WHERE a.transaction_id is NULL
GROUP by b.customer_id 
