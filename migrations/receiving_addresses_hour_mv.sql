create materialized view if not exists receiving_addresses_hour_mv
engine = AggregatingMergeTree() order by (dt_hour)
populate as
select
    toStartOfHour(dt)  dt_hour
    ,uniq(to)          receiving_addresses
from transactions
group by dt_hour;