create materialized view if not exists transaction_volume_block_mv_demo
engine = SummingMergeTree() order by (block)
populate as
select
    max(dt)         dt_block
    ,depth          block
    ,sum(amount)    transaction_volume
from transactions_demo
group by depth;