SELECT to_char(activity_date,'yyyy-MM-DD') as day,count(DISTINCT user_id  ) as active_users 
FROM Activity
WHERE to_char(activity_date,'yyyy-MM-DD')<='2019-07-27'
and to_char(activity_date,'yyyy-MM-DD')>='2019-06-27'
GROUP BY 1
