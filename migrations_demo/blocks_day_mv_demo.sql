create materialized view if not exists blocks_day_mv_demo
engine = AggregatingMergeTree() order by (dt_day)
populate as
select
    toStartOfDay(dt)    dt_day
    ,uniq(depth)        blocks
from blocks_demo
group by dt_day;