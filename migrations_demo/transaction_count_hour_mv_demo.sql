create materialized view if not exists transaction_count_hour_mv_demo
engine = AggregatingMergeTree() order by (dt_hour, address)
populate as
select
    toStartOfHour(dt)       dt_hour
    ,arrayJoin([from, to])  address
    ,count(*)               transactions
from transactions_demo
group by dt_hour, address;