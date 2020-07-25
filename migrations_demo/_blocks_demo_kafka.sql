CREATE TABLE IF NOT EXISTS blocks_demo_kafka (
    coinbase String,
    depth UInt32,
    nonce UInt64,
    previous_block_hash String,
    dt DateTime
) ENGINE = Kafka('kafka:9092', 'blocks_demo', 'def_group', 'JSONEachRow');