with q0 as (
SELECT 
date_format(start_time,'%Y-%m-%d') cur_date,
tag,
sum(if_like) cur_like,
sum(if_retweet) cur_retweet
FROM tb_user_video_log  l
LEFT join tb_video_info t ON l.video_id	= t.video_id	
GROUP BY 1,2
),

q1 as (SELECT 
tag,
cur_date,
sum(cur_like) OVER(PARTITION BY tag ORDER BY cur_date ROWS between 6  preceding and current row ) 	sum_like_cnt_7d	,
max(cur_retweet) OVER(PARTITION BY tag ORDER BY cur_date ROWS between 6 preceding and current row) max_retweet_cnt_7d
FROM q0 
) 

SELECT *
FROM q1 
WHERE cur_date BETWEEN '2021-10-01' AND '2021-10-03'
ORDER by tag DESC,cur_date 


