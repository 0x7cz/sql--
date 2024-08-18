WITH q0 as (
SELECT 
author,
date_format(start_time,'%Y-%m') month,
avg(case WHEN if_follow=2 THEN -1 
ELSE if_follow END) fans_growth_rate,
sum(case WHEN if_follow=2 THEN -1 
ELSE if_follow END) cur_fans
FROM tb_user_video_log  l
LEFT join tb_video_info t ON l.video_id	= t.video_id	
WHERE YEAR(start_time)='2021'

GROUP BY author,date_format(start_time,'%Y-%m')
)
SELECT
    author,
    month,
    round(fans_growth_rate,3),
    sum(cur_fans) OVER(PARTITION BY author ORDER BY month) total_fans
FROM q0
ORDER BY 1,4
-- 按创作者ID、总粉丝量升序排序。