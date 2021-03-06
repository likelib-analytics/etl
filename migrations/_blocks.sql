CREATE TABLE IF NOT EXISTS blocks (
    coinbase String,
    depth UInt32,
    nonce UInt64,
    previous_block_hash String,
    dt DateTime
) ENGINE = ReplacingMergeTree() ORDER BY (depth);