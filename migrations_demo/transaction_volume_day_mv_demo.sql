create materialized view if not exists transaction_volume_day_mv_demo
engine = SummingMergeTree() order by (dt_day)
populate as
select
    toStartOfDay(dt)     dt_day
    ,sum(amount)         transaction_volume
from transactions_demo
group by dt_day;