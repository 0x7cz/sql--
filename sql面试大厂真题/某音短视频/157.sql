with q0 as (
SELECT
tag,duration,
CASE WHEN timestampdiff(second,start_time,end_time)>duration THEN duration 
ELSE  timestampdiff(second,start_time,end_time) END as t_duration
FROM tb_user_video_log t
LEFT JOIN tb_video_info i
ON t.video_id = i.video_id
)

SELECT tag,
concat(round(avg(t_duration/duration)*100,2),'%')avg_play_progress

FROM q0 
GROUP BY tag
HAVING avg(t_duration/duration)>0.6
ORDER BY 2 DESC
