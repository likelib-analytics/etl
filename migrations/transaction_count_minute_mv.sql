create materialized view if not exists transaction_count_minute_mv
engine = AggregatingMergeTree() order by (dt_minute, address)
populate as
select
    toStartOfMinute(dt)     dt_minute
    ,arrayJoin([from, to])  address
    ,count(*)               transactions
from transactions
group by dt_minute, address;