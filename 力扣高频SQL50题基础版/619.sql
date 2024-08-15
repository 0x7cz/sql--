SELECT max(num)
FROM 
(SELECT num
FROM MyNumbers 
GROUP by num
HAVING count(1)=1) a
