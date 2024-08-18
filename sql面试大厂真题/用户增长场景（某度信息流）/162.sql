SELECT date_format(in_time,'%Y-%m-%d') dt,
round(sum(timestampdiff(second,in_time,out_time))/count(DISTINCT uid),1) avg_viiew_len_sec
FROM tb_user_log
WHERE date_format(in_time,'%Y-%m') ='2021-11' 
AND artical_id!=0
GROUP BY date_format(in_time,'%Y-%m-%d') 
ORDER BY 2