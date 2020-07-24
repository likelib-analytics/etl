create table if not exists transactions_demo (
    from String,
    to String,
    transactionHash String,
    type String,
    amount UInt64,
    data String,
    fee UInt64,
    dt DateTime,
    depth UInt32
) engine = ReplacingMergeTree() order by (from, to, dt, transactionHash);