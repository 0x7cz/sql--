SELECT
    pay_ability,
    CONCAT(round(count(overdue_days) / count(1) * 100, 1),'%') as overdue_ratio
FROM
    loan_tb l
    LEFT JOIN customer_tb c ON l.customer_id = c.customer_id
GROUP BY
    pay_ability
order by 2 desc 
