create materialized view if not exists transaction_count_block_mv_demo
engine = AggregatingMergeTree() order by (block, address)
populate as
select
    max(dt)                 dt_block
    ,depth                  block
    ,arrayJoin([from, to])  address
    ,count(*)               transactions
from transactions_demo
group by depth, address;