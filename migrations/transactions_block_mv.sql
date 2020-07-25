create materialized view if not exists transactions_block_mv
engine = AggregatingMergeTree() order by (block)
populate as
select
    max(dt)     dt_block
    ,depth      block
    ,count(*)   transactions
from transactions
group by depth;