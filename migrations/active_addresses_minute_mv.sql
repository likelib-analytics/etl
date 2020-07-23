create materialized view if not exists active_addresses_minute_mv
engine = AggregatingMergeTree() order by (dt_minute)
populate as
select
    toStartOfMinute(dt)             dt_minute
    ,uniq(arrayJoin([from, to]))    active_addresses
from transactions
group by dt_minute;