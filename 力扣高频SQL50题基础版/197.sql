SELECT  a.id 
FROM Weather a
LEFT JOIN Weather b
on (a.recordDate-1)=b.recordDate
WHERE a.temperature > b.temperature



