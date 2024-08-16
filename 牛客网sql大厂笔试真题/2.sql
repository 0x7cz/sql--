-- 请用SQL实现“2023年1月1日-2023年1月31日用户最长的连续登录天数”
 WITH q0 as
    (SELECT user_id,
            row_number() OVER(PARTITION BY user_id
                              ORDER BY fdate) rk,
                              fdate
     FROM tb_dau
     WHERE date_format(fdate,'%Y%m%d') BETWEEN '20230101' AND '20230131' ),
q1 as (
    SELECT
        user_id,
        DATE_SUB(fdate, interval rk day) ,
        count(1) consec_days
    FROM q0
    GROUP BY 1,2
)


SELECT user_id,max(consec_days) max_consec_days
FROM q1
GROUP BY user_id


