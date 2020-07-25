CREATE MATERIALIZED VIEW IF NOT EXISTS blocks_demo_mv TO blocks_demo
AS
SELECT 
    coinbase,
    depth,
    nonce,
    previous_block_hash,
    dt
FROM blocks_demo_kafka;
