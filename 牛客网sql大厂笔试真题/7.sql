SELECT s.staff_id,staff_name
FROM staff_tb s
LEFT JOIN cultivate_tb c
ON s.staff_id = c.staff_id
WHERE course LIKE '%course3%'
order by s.staff_id