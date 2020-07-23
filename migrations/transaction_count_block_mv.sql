create materialized view if not exists transaction_count_block_mv
engine = AggregatingMergeTree() order by (block, address)
populate as
select
    max(dt)                 dt_block
    ,depth                  block
    ,arrayJoin([from, to])  address
    ,count(*)               transactions
from transactions
group by depth, address;