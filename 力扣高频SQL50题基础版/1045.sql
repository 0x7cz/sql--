SELECT customer_id 
FROM Customer 
GROUP by customer_id 
HAVING count(DISTINCT product_key )=(
    SELECT count(1)
    FROM Product 
)