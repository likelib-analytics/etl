CREATE MATERIALIZED VIEW IF NOT EXISTS blocks_mv TO blocks
AS
SELECT 
    coinbase,
    depth,
    nonce,
    previous_block_hash,
    dt
FROM blocks_kafka;