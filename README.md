# LikeLib ETL and analytics

## Migrations

The migrations contain all the necessary SQL queries with table schemas and definitions.
To start the migrations you need to run the following command:
```
CH_HOST='some-ch-url.com:8123' python run_migrations.py
```
**Note:** The current version will start both live and demo migrations

## Query examples

Most of the Materialized Views are created in such a way that they can be queried directly.
For example:
```
select 
    dt_day
    ,addresses
from active_addresses_day_mv
```
Here the result will be the amount of active addresses for every given day.

Another example:
```
select
    dt_minute
    ,addresses
    ,transactions
from transaction_count_minute_mv
```
This query will result in the transaction count for every single address for every minute.

However, some metrics are built with the help of the AggregateFunction, and hence their Materialized Views **do not** store the values directly. Instead, they store an intermediate preaggregated `State` of the desired aggregation field. This can be then queried as follows:

```
select 
    dt_day
    ,runningAccumulate(addresses)
from network_size_state_day_mv
```

**Note:** This query will return a time series with the running netowrk size. Currently the following metrics have be fetched in a similar way:
- Netowork Size (daily)
- Netowork Size (hourly)
- Netowork Size (per minute)

**Note:** The `balance` of a certain address can be fetched in the same way:
- either up to a given block number (`depth`):
```
select
    block,
    address,
    runningAccumulate(balance)
from balance_block_mv
where address = 'some-address-xyz'
  and block <= 42069
```

- or up to a particular datetime:
```
select
    dt_block,
    address,
    runningAccumulate(balance)
from balance_block_mv
where address = 'some-address-xyz'
  and dt_block <= toDateTime('2020-08-09 20:00:00')
```

## Demo

All the present metrics can be both queried in *live* and *demo* mode. The only difference for *demo* is the `_demo` suffix that is attached to every corresponding table name, for instance:
```
sending_addresses_hour_mv_demo
```