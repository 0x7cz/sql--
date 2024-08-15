SELECT 
(CASE WHEN mod(id,2)=1 AND id!=counts THEN id +1
WHEN mod(id,2)=1 AND id=counts THEN id
ELSE id-1
END) as id,student

FROM Seat a,(
    SELECT count(1) as counts
    FROM Seat
    ) as b

ORDER by id 
