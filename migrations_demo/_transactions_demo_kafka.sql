CREATE TABLE IF NOT EXISTS transactions_demo_kafka (
    from String,
    to String,
    transactionHash String,
    type String,
    amount UInt64,
    data String,
    fee UInt64,
    dt DateTime,
    depth UInt32
) ENGINE = Kafka('kafka:19092', 'transactions_demo', 'def_group', 'JSONEachRow');