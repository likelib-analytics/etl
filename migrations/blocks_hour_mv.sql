create materialized view if not exists blocks_hour_mv
engine = AggregatingMergeTree() order by (dt_hour)
populate as
select
    toStartOfHour(dt)   dt_hour
    ,uniq(depth)        blocks
from blocks
group by dt_hour;