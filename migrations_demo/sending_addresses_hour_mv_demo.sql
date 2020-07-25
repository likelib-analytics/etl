create materialized view if not exists sending_addresses_hour_mv_demo
engine = AggregatingMergeTree() order by (dt_hour)
populate as
select
    toStartOfHour(dt)   dt_hour
    ,uniq(from)         sending_addresses
from transactions_demo
group by dt_hour;