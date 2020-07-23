create materialized view if not exists transactions_hour_mv
engine = AggregatingMergeTree() order by (dt_hour)
populate as
select
    toStartOfHour(dt)     dt_hour
    ,count(*)             transactions
from transactions
group by dt_hour;