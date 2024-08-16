with t1 as(
    select user_id,date_format(reg_time,'%Y-%m-%d') as fisrt_time,
           date_format(log_time,'%Y-%m-%d') as log_time1,
           row_number() over(partition by user_id order by log_time) as rnk
    from register_tb
    join login_tb using(user_id)
),
t2 as(
    select user_id,date_sub(log_time1,interval rnk day) as dt_line
    from t1
),
t3 as(
    select user_id,dt_line,count(1) as continuous_date
    from t2
    group by user_id,dt_line
)
select user_id
from t3
where continuous_date>=3


with t1 as(
    select user_id,date_format(reg_time,'%Y-%m-%d') as fisrt_time,
           date_format(log_time,'%Y-%m-%d') as log_time1,
           row_number() over(partition by user_id order by log_time) as rnk
    from register_tb
    join login_tb using(user_id)
),
t2 as(
    select user_id,date_sub(log_time1,interval rnk day) as dt_line
    from t1
),
t3 as(
    select user_id,dt_line,count(1) as continuous_date
    from t2
    group by user_id,dt_line
)
select user_id
from t3
where continuous_date>=3
