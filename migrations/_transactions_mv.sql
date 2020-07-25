CREATE MATERIALIZED VIEW IF NOT EXISTS transactions_mv TO transactions
AS
SELECT 
    from,
    to,
    transactionHash,
    type,
    amount,
    data,
    fee,
    dt,
    depth
FROM transactions_kafka;