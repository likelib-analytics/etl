create materialized view if not exists active_addresses_minute_mv_demo
engine = AggregatingMergeTree() order by (dt_minute)
populate as
select
    toStartOfMinute(dt)             dt_minute
    ,uniq(arrayJoin([from, to]))    active_addresses
from transactions_demo
group by dt_minute;