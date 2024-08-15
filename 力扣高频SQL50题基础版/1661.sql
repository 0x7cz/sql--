SELECT a.machine_id,ROUND(cast(avg(b.timestamp- a.timestamp) AS NUMERIC ),3) as processing_time 
FROM Activity a 
INNER JOIN  Activity b
on a.machine_id =b.machine_id 
and a.process_id = b.process_id 
and a.activity_type = 'start'
and b.activity_type = 'end'

GROUP by a.machine_id