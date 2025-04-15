{{ config(
    materialized = 'view'
) }}

WITH raw AS (
    SELECT *
    FROM read_json_auto('s3://my-stock-data-bucket/stocks/*/*/*/*.json')
)

SELECT
    CAST(symbol AS TEXT) AS symbol,
    CAST(datetime AS TIMESTAMP) AS datetime,
    CAST(open AS DOUBLE) AS open,
    CAST(high AS DOUBLE) AS high,
    CAST(low AS DOUBLE) AS low,
    CAST(close AS DOUBLE) AS close,
    CAST(volume AS BIGINT) AS volume
FROM raw
WHERE symbol IS NOT NULL AND datetime IS NOT NULL
