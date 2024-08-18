
-- 求解用户注册时间
with q0 as (
select uid,
date_format(in_time,'%Y-%m-%d') in_time,
date_format(out_time,'%Y-%m-%d') out_time,
min(date_format(in_time,'%Y-%m-%d')) OVER(PARTITION BY uid ORDER BY date_format(in_time,'%Y-%m-%d')) as min_day,
min(date_format(date_add(in_time,interval 1 day),'%Y-%m-%d')) OVER(PARTITION BY uid ORDER BY date_format(in_time,'%Y-%m-%d')) as next_day
from tb_user_log
),

-- 求得第二天留存的用户
q1 as (
    select 
    uid,
    min_day
    from q0 
    WHERE next_day=in_time or next_day=out_time
    GROUP BY uid,min_day
),

q2 as (

    SELECT uid,min_day
    FROM q0 
    GROUP BY uid,min_day
)

SELECT
q2.min_day,
round(count(q1.uid)/count(q2.uid),2) uv_left_rate
FROM q2 LEFT JOIN q1
ON q1.uid=q2.uid
WHERE date_format(in_time,'%Y-%m') ='2021-11' 
GROUP by q2.min_day


