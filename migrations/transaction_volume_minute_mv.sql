create materialized view if not exists transaction_volume_minute_mv
engine = SummingMergeTree() order by (dt_minute)
populate as
select
    toStartOfMinute(dt)     dt_minute
    ,sum(amount)            transaction_volume
from transactions
group by dt_minute;