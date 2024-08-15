SELECT b.user_id,round((CASE WHEN confirmation_rate is NULL THEN 0 ELSE confirmation_rate END),2) as confirmation_rate 
FROM Signups b
LEFT JOIN (
SELECT avg(
    CASE WHEN action = 'confirmed' THEN 1 
    ELSE 0 END
) as confirmation_rate,user_id
FROM Confirmations
GROUP BY user_id) a
on b.user_id=a.user_id




