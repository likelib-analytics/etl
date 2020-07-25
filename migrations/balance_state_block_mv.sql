create materialized view if not exists balance_state_block_mv
engine = SummingMergeTree() order by (block, address)
populate as
select
    depth               block
    ,address            address
    ,max(dt)            dt_block
    ,sumState(state)    balance
from
(
    select
        dt                                          dt
        ,depth                                      depth
        ,arrayJoin([(from, -1 * toInt64(amount)),
                    (to, toInt64(amount))])         address_amount
        ,address_amount.1                           address
        ,address_amount.2                           state
    from transactions
)
group by block, address