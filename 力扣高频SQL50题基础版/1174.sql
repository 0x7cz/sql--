SELECT round(avg(case when t then 1 else 0 end )*100,2) immediate_percentage 
FROM (
    SELECT  min(to_char(order_date,'YYYY-MM-DD'))=min(to_char(customer_pref_delivery_date,'YYYY-MM-DD'))  as t
    FROM Delivery 
    GROUP BY customer_id                 
)  a   