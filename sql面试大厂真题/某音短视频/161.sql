with q0 as (
    SELECT l.video_id,start_time,end_time,duration,if_like,if_retweet,comment_id
    FROM tb_user_video_log l
    LEFT join tb_video_info t ON l.video_id	= t.video_id	
    WHERE release_time>=(
        SELECT  max(date_sub(end_time,INTERVAL 29 DAY))
        FROM tb_user_video_log
    )

),

q1 as (
    SELECT 
        video_id,
        avg(CASE WHEN timestampdiff(second,start_time,end_time)>=duration THEN 1 ELSE 0 END) play_avg,
        sum(if_like) likes,
        sum(if_retweet) retweets,
        count(comment_id) comments,
        max(start_time) last_play
    FROM q0
    GROUP BY video_id

),

q2 as (

SELECT 
    video_id,
    min(fresh) fresh
FROM (
SELECT 
    video_id,
    DATEDIFF((
        SELECT MAX(end_time)
        FROM tb_user_video_log
    ),end_time) AS fresh
FROM tb_user_video_log
) a
GROUP by 1
)

SELECT q1.video_id,round((100*play_avg+5*likes+3*comments+2*retweets)*(1/(fresh+1)),0) hot_index
FROM q1
INNER join q2 ON q1.video_id=q2.video_id
ORDER BY 2 DESC 
LIMIT 3


-- SELECT q1.video_id,play_avg,likes,comments,retweets,fresh+1
-- FROM q1
-- LEFT join q2 ON q1.video_id=q2.video_id








