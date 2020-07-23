create materialized view if not exists active_addresses_hour_mv
engine = AggregatingMergeTree() order by (dt_hour)
populate as
select
    toStartOfHour(dt)               dt_hour
    ,uniq(arrayJoin([from, to]))    active_addresses
from transactions
group by dt_hour;