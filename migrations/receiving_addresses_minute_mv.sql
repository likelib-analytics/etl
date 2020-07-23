create materialized view if not exists receiving_addresses_minute_mv
engine = AggregatingMergeTree() order by (dt_minute)
populate as
select
    toStartOfMinute(dt)     dt_minute
    ,uniq(to)               receiving_addresses
from transactions
group by dt_minute;