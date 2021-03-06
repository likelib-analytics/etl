create materialized view if not exists network_size_state_day_mv
engine = AggregatingMergeTree() order by (dt_day)
populate as
select 
    toStartOfDay(dt)                        dt_day
    ,uniqState(arrayJoin([from, to]))       network_size_state
from transactions 
group by dt_day;