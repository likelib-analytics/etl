create materialized view if not exists receiving_addresses_day_mv_demo
engine = AggregatingMergeTree() order by (dt_day)
populate as
select
    toStartOfDay(dt)    dt_day
    ,uniq(to)           receiving_addresses
from transactions_demo
group by dt_day;