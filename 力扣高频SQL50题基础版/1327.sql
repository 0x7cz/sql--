SELECT product_name,sum(unit) unit 
FROM Products a
LEFT JOIN Orders b ON a.product_id=b.product_id       
WHERE to_char(order_date,'yyyy-MM')='2020-02'
GROUP BY product_name
HAVING sum(unit)>=100