SELECT b.product_id,COALESCE(Round(sum(price*units)/cast(sum(units) as NUmeric),2),0) as average_price 
FROM UnitsSold a
Right JOIN Prices b
ON a.product_id = b.product_id    
AND a.purchase_date <= b.end_date 
AND  a.purchase_date >= b.start_date 
GROUP BY b.product_id 