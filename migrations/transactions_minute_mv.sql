create materialized view if not exists transactions_minute_mv
engine = AggregatingMergeTree() order by (dt_minute)
populate as
select
    toStartOfMinute(dt)     dt_minute
    ,count(*)               transactions
from transactions
group by dt_minute;