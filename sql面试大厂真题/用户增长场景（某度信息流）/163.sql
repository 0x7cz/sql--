with q0 as (select artical_id,in_time as cur_time,1 as num
from tb_user_log 
union all 
select artical_id,out_time as cur_time,-1 as num
from tb_user_log )

select 
    artical_id,
    sum(num) OVER(PARTITION BY artical_id ORDER BY cur_time )
from q0 

