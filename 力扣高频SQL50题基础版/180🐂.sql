SELECT disitnct num
FROM
(
SELECT num,
rank() over(ORDER by id ) as i_r,
rank() over(PARTITION by num ORDER by id ) as n_r
FROM Logs) a 
GROUP BY num,,i_r-n_r
HAVING count(1)>3
