create materialized view if not exists network_size_state_minute_mv
engine = AggregatingMergeTree() order by (dt_minute)
populate as
select 
    toStartOfMinute(dt)                      dt_minute
    ,uniqState(arrayJoin([from, to]))        addresses
from transactions 
group by dt_minute;