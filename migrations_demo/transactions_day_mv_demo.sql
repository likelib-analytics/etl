create materialized view if not exists transactions_day_mv_demo
engine = AggregatingMergeTree() order by (dt_day)
populate as
select
    toStartOfDay(dt)     dt_day
    ,count(*)            transactions
from transactions_demo
group by dt_day;