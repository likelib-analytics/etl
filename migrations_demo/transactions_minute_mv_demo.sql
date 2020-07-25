create materialized view if not exists transactions_minute_mv_demo
engine = AggregatingMergeTree() order by (dt_minute)
populate as
select
    toStartOfMinute(dt)     dt_minute
    ,count(*)               transactions
from transactions_demo
group by dt_minute;