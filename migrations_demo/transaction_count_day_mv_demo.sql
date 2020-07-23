create materialized view if not exists transaction_count_day_mv_demo
engine = AggregatingMergeTree() order by (dt_day, address)
populate as
select
    toStartOfDay(dt)        dt_day
    ,arrayJoin([from, to])  address
    ,count(*)               transactions
from transactions_demo
group by dt_day, address;