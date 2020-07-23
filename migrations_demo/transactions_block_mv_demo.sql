create materialized view if not exists transactions_block_mv_demo
engine = AggregatingMergeTree() order by (block)
populate as
select
    max(dt)     dt_block
    ,depth      block
    ,count(*)   transactions
from transactions_demo
group by depth;