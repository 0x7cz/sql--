with q0 as (select uid,in_time as time
from tb_user_log
union all
select uid,out_time as time
from tb_user_log) ,

q1 as (
    select uid,max(to_days(time)) over() cur_time,
    min(to_days(time)) over(partition by uid) reg_time,
    max(to_days(time)) over(partition by uid ) max_time
    from q0
),

q2 as (
select q0.uid,min(cur_time-max_time) last_day,min(cur_time-reg_time) reg_day
from q0 
left join q1 on q0.uid=q1.uid
group by q0.uid
),


q3 as (	
select
'忠实用户' as user_grade,sum(case when last_day<7 and reg_day>7 then 1 else 0 end) as num

from q2 
UNION ALL
select
'新晋用户' as user_grade,sum(case when  reg_day<7 then 1 else 0 end) as num

from q2 
UNION ALL
select
'沉睡用户' as user_grade,sum(case when last_day>=7 and last_day<30 then 1 else 0 end)  as num

from q2 
UNION ALL
select
'流失用户' as user_grade,sum(case when  last_day>=30 then 1 else 0 end)   as num

from q2
)

SELECT 
user_grade,round(num/(SELECT sum(num) from q3),2) as ratio
FROM q3 
order by 2 desc




