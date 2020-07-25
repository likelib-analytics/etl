create materialized view if not exists transaction_count_minute_mv_demo
engine = AggregatingMergeTree() order by (dt_minute, address)
populate as
select
    toStartOfMinute(dt)     dt_minute
    ,arrayJoin([from, to])  address
    ,count(*)               transactions
from transactions_demo
group by dt_minute, address;