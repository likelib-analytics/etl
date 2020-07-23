create materialized view if not exists transaction_count_day_mv
engine = AggregatingMergeTree() order by (dt_day, address)
populate as
select
    toStartOfDay(dt)        dt_day
    ,arrayJoin([from, to])  address
    ,count(*)               transactions
from transactions
group by dt_day, address;