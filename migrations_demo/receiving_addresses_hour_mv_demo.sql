create materialized view if not exists receiving_addresses_hour_mv_demo
engine = AggregatingMergeTree() order by (dt_hour)
populate as
select
    toStartOfHour(dt)  dt_hour
    ,uniq(to)          receiving_addresses
from transactions_demo
group by dt_hour;