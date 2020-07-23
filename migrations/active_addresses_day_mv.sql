create materialized view if not exists active_addresses_day_mv
engine = AggregatingMergeTree() order by (dt_day)
populate as
select
    toStartOfDay(dt) dt_day
    ,uniq(arrayJoin([from, to]))  active_addresses
from transactions
group by dt_day;