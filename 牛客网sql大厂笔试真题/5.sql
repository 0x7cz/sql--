SELECT user_id,c.room_id,room_type,datediff(checkout_time,checkin_time) as days
FROM checkin_tb c
LEFT JOIN guestroom_tb g
ON c.room_id = g.room_id
WHERE date_format(checkin_time,'%Y-%m-%d') = '2022-06-12'
AND datediff(checkout_time,checkin_time)>1
