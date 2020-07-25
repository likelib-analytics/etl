create materialized view if not exists blocks_minute_mv
engine = AggregatingMergeTree() order by (dt_minute)
populate as
select
    toStartOfMinute(dt)     dt_minute
    ,uniq(depth)            blocks
from blocks
group by dt_minute;