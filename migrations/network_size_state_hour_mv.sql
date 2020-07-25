create materialized view if not exists network_size_state_hour_mv
engine = AggregatingMergeTree() order by (dt_hour)
populate as
select 
    toStartOfHour(dt)                        dt_hour
    ,uniqState(arrayJoin([from, to]))        network_size_state
from transactions 
group by dt_hour;