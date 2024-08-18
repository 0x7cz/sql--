SELECT
t.video_id,
round(avg(CASE WHEN timestampdiff(second,start_time,end_time)>=duration THEN 1 ELSE 0  END),3) avg_comp_play_rate
FROM tb_user_video_log t
LEFT JOIN tb_video_info i
ON t.video_id = i.video_id
WHERE YEAR(start_time)='2021'
GROUP BY t.video_id
ORDER BY 2 desc
