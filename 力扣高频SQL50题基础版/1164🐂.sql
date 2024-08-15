SELECT  distinct a.product_id,
CASE WHEN c.product_id is NULL THEN 10 
ELSE c.new_price END  as price 
FROM Products a
LEFT join (
SELECT product_id,new_price      
FROM Products b
WHERE (product_id,change_date) in (SELECT product_id,max(change_date)
FROM Products
WHERE to_char(change_date,'yyyy-MM-DD')<='2019-08-16'
GROUP by product_id ) ) c
on a.product_id = c.product_id


其它解法：
用开窗函数给log_date排序后得到num=1