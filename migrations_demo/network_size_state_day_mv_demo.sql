create materialized view if not exists network_size_state_day_mv_demo
engine = AggregatingMergeTree() order by (dt_day)
populate as
select 
    toStartOfDay(dt)                        dt_day
    ,uniqState(arrayJoin([from, to]))       addresses
from transactions_demo
group by dt_day;