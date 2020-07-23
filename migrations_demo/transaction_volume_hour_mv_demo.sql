create materialized view if not exists transaction_volume_hour_mv_demo
engine = SummingMergeTree() order by (dt_hour)
populate as
select
    toStartOfHour(dt)     dt_hour
    ,sum(amount)          transaction_volume
from transactions_demo
group by dt_hour;