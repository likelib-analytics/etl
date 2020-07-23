create materialized view if not exists transaction_volume_block_mv
engine = SummingMergeTree() order by (block)
populate as
select
    max(dt)         dt_block
    ,depth          block
    ,sum(amount)    transaction_volume
from transactions
group by depth;