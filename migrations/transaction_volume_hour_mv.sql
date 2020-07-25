create materialized view if not exists transaction_volume_hour_mv
engine = SummingMergeTree() order by (dt_hour)
populate as
select
    toStartOfHour(dt)     dt_hour
    ,sum(amount)          transaction_volume
from transactions
group by dt_hour;