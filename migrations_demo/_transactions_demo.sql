CREATE TABLE IF NOT EXISTS transactions_demo (
    from String,
    to String,
    transactionHash String,
    type String,
    amount UInt64,
    data String,
    fee UInt64,
    dt DateTime,
    depth UInt32
) ENGINE = ReplacingMergeTree() ORDER BY (from, to, dt, transactionHash);