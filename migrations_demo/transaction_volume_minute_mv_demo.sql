create materialized view if not exists transaction_volume_minute_mv_demo
engine = SummingMergeTree() order by (dt_minute)
populate as
select
    toStartOfMinute(dt)     dt_minute
    ,sum(amount)            transaction_volume
from transactions_demo
group by dt_minute;