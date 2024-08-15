
SELECT product_id,product_name 
FROM Product 
WHERE product_id not in (
SELECT   a.product_id
FROM Product  a
LEFT JOIN Sales b
on a.product_id = b.product_id 
WHERE to_char(sale_date,'yyyy-MM-DD')<'2019-01-01'
OR to_char(sale_date,'yyyy-MM-DD')>'2019-03-31'
OR b.product_id is NULL
group by a.product_id,product_name ) 

select product_id, product_name
from product 
where product_id not in (
  select s.product_id
  from sales s
  where sale_date < '2019-01-01' or sale_date > '2019-03-31'
)
and product_id in (
  select s.product_id
  from sales s 
)




SELECT a.product_id, b.product_name
FROM Sales as a
LEFT JOIN Product b
on a.product_id = b.product_id
GROUP by a.product_id,b.product_name
HAVING to_char(min(sale_date),'yyyy-MM-DD')>='2019-01-01'
AND to_char(max(sale_date),'yyyy-MM-DD')<='2019-03-31'