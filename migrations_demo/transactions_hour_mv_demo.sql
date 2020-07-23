create materialized view if not exists transactions_hour_mv_demo
engine = AggregatingMergeTree() order by (dt_hour)
populate as
select
    toStartOfHour(dt)     dt_hour
    ,count(*)             transactions
from transactions_demo
group by dt_hour;