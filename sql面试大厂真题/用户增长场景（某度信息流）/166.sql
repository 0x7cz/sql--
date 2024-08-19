WITH t1 AS
    (SELECT DISTINCT uid,DATE(in_time) dt,MIN(DATE(in_time))OVER(PARTITION BY uid) new_dt
     FROM tb_user_log
     UNION SELECT DISTINCT uid,DATE(out_time) dt,MIN(DATE(in_time))OVER(PARTITION BY uid) new_dt
     FROM tb_user_log)
SELECT dt,
       COUNT(1) dau,
       ROUND(SUM(IF(dt=new_dt,1,0))/COUNT(1),2) uv_new_ratio
FROM t1
GROUP BY dt
ORDER BY dt ASC;