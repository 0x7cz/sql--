SELECT product_name,
       sum_quantity total_sales,
       rank() OVER(PARTITION BY category
                   ORDER BY sum_quantity desc,product_id) category_rank
FROM
    (SELECT o.product_id,
            max(name) product_name,
            max(category) category,
            sum(quantity) sum_quantity
     FROM products p
     INNER JOIN orders o ON p.product_id = o.product_id
     GROUP BY o.product_id) a
order by category,
         total_sales desc



-- 窗口函数内部使用聚合函数排序
-- SELECT 
--        max(name) product_name,
--        sum(quantity) total_sales,
--        rank() OVER(PARTITION BY category ORDER BY sum(quantity) desc,o.product_id  ) category_rank

-- FROM products p
-- INNER JOIN orders o ON p.product_id = o.product_id
-- GROUP BY o.product_id
-- order by category,
--          total_sales desc