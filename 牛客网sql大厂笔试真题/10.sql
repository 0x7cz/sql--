SELECT post,round(avg(TIMESTAMPDIFF(second,first_clockin,last_clockin))/3600,3) work_hours
FROM staff_tb s
LEFT JOIN attendent_tb a
ON s.staff_id= a.staff_id 
GROUP BY post
ORDER BY 2 DESC