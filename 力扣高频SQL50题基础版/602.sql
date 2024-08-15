
WITH q1 as (
SELECT requester_id,count(requester_id) a
FROM RequestAccepted  
GROUP BY requester_id
),
q2 as (
    SELECT accepter_id,count(accepter_id) b
    FROM RequestAccepted  
    GROUP BY accepter_id
)


SELECT  id ,a+b num
FROM
(
SELECT 
(CASE WHEN requester_id is NULL THEN accepter_id 
ELSE requester_id END ) id,
(CASE WHEN  a is null then 0 
ELSE a END) a,
(CASE WHEN  b is null then 0 
ELSE b END) b
FROM q1 
FULL JOIN q2
ON requester_id=accepter_id
) a
order by 2 desc 
limit 1 




--  答案
-- 答案是合成一列进行操作，我是将两列分别计数后，再关联相加，但是相加过程要考虑null
select ids as id, cnt as num
from
(
select ids, count(*) as cnt
   from
   (
        select requester_id as ids from RequestAccepted
        union all
        select accepter_id from RequestAccepted
    ) as tbl1
   group by ids
   ) as tbl2
order by cnt desc
limit 1
;

-- 作者：LeetCode
-- 链接：https://leetcode.cn/problems/friend-requests-ii-who-has-the-most-friends/solutions/23104/hao-you-shen-qing-ii-shui-you-zui-duo-de-hao-you-b/
-- 来源：力扣（LeetCode）
-- 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。