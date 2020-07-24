create table if not exists blocks_demo (
    coinbase String,
    depth UInt32,
    nonce UInt64,
    previous_block_hash String,
    dt DateTime
) engine = ReplacingMergeTree() order by (depth);