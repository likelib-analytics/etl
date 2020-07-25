create materialized view if not exists blocks_hour_mv_demo
engine = AggregatingMergeTree() order by (dt_hour)
populate as
select
    toStartOfHour(dt)   dt_hour
    ,uniq(depth)        blocks
from blocks_demo
group by dt_hour;