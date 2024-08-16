-- 从听歌流水中找到18-25岁用户在2022年每个月播放次数top 3的周杰伦的歌曲


SELECT *
FROM
(
SELECT
    month,
    row_number() OVER (
        PARTITION BY month
        ORDER BY
            counts DESC,
            song_id 
    ) ranking,
    song_name,
    counts as play_pv
from
    (
        SELECT
            MONTH (fdate) as month,
            a.song_id,
            count(a.song_id) counts,
            song_name
        FROM
            play_log a
            LEFT JOIN song_info b ON a.song_id = b.song_id
            LEFT JOIN user_info c on a.user_id = c.user_id
        WHERE
            singer_name = '周杰伦'
            AND year (fdate) = '2022'
            AND age BETWEEN 18 AND 25
        GROUP BY
            MONTH (fdate),
            a.song_id,
            song_name
    ) a
) b
WHERE ranking<=3
ORDER BY 1,2
