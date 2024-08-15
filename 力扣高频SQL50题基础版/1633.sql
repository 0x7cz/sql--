SELECT contest_id,Round(count(1)/CAST(a.u_num  as NUMERIC)*100,2)as percentage 
FROM Register r
LEFT JOIN Users u 
ON r.user_id = u.user_id 
LEFT JOIN (SELECT count(1) as u_num FROM Users ) a
ON 1=1
GROUP BY contest_id,a.u_num
ORDER BY 2 DESC ,1 