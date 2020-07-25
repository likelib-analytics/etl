CREATE MATERIALIZED VIEW IF NOT EXISTS transactions_demo_mv TO transactions_demo
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
FROM transactions_demo;
