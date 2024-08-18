WITH q0 as (
SELECT
    tag,   	
    sum(if_retweet) retweet_cut,
    round(avg(if_retweet ),3) retweet_rate
FROM
    tb_user_video_log t
    LEFT JOIN tb_video_info i ON t.video_id = i.video_id
WHERE
    start_time > (
        SELECT
        max(date_sub(start_time, interval 29 day))
        from
            tb_user_video_log
    ) 
GROUP BY tag
),

q1 as (
    SELECT tag
    FROM tb_video_info
    GROUP BY tag
)

SELECT
    q1.tag,
    CASE WHEN q0.tag is null then 0 ELSE retweet_cut END,
    CASE WHEN q0.tag is null then 0 ELSE retweet_rate END

FROM q1 LEFT JOIN q0 ON q0.tag=q1.tag
ORDER by 2 DESC
