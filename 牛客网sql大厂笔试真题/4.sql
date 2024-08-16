SELECT
    date_format(t_time,'%Y-%m') time,
    sum(t_amount) total
FROM
    trade t
    LEFT join customer c ON t.t_cus = c.c_id
WHERE
    c_name = 'Tom'
    AND YEAR (t_time) = '2023'
    AND t_type = 1
GROUP BY 1
order by 1 