create materialized view if not exists sending_addresses_day_mv
engine = AggregatingMergeTree() order by (dt_day)
populate as
select
    toStartOfDay(dt) dt_day
    ,uniq(from)      sending_addresses
from transactions
group by dt_day;