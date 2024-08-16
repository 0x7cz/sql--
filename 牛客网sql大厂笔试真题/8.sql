SELECT round(avg(distinct score),3) avg_score
FROM(
SELECT DISTINCT *
FROM user_action_tb u
LEFT JOIN recommend_tb r
ON r.rec_user=u.user_id 
AND r.rec_info_l = u.hobby_l
WHERE r.rec_user is NOT NULL)