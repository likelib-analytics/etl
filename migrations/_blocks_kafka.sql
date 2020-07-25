CREATE TABLE IF NOT EXISTS blocks_kafka (
    coinbase String,
    depth UInt32,
    nonce UInt64,
    previous_block_hash String,
    dt DateTime
) ENGINE = Kafka('kafka:19092', 'blocks', 'def_group', 'JSONEachRow');