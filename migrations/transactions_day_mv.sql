create materialized view if not exists transactions_day_mv
engine = AggregatingMergeTree() order by (dt_day)
populate as
select
    toStartOfDay(dt)     dt_day
    ,count(*)            transactions
from transactions
group by dt_day;