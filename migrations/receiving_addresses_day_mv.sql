create materialized view if not exists receiving_addresses_day_mv
engine = AggregatingMergeTree() order by (dt_day)
populate as
select
    toStartOfDay(dt)    dt_day
    ,uniq(to)           receiving_addresses
from transactions
group by dt_day;