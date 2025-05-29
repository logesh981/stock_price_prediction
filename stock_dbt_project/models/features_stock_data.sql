{{ config(
    materialized = 'table' 
) }}

WITH base AS (
    SELECT
        symbol,
        datetime,
        open,
        high,
        low,
        close,
        volume,
        
        -- Previous close for daily return
        LAG(close, 1) OVER (PARTITION BY symbol ORDER BY datetime) AS prev_close,

        -- Rolling 5-period average and stddev of close
        AVG(close) OVER (
            PARTITION BY symbol 
            ORDER BY datetime 
            ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
        ) AS rolling_avg_5,

        STDDEV(close) OVER (
            PARTITION BY symbol 
            ORDER BY datetime 
            ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
        ) AS rolling_std_5,

        -- Daily price range
        (high - low) AS daily_range,

        -- Rolling 5-period average of volume
        AVG(volume) OVER (
            PARTITION BY symbol 
            ORDER BY datetime 
            ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
        ) AS avg_volume_5
    FROM {{ ref('stg_stock_data') }}
),

features AS (
    SELECT
        *,
        
        -- Daily return percentage
        CASE 
            WHEN prev_close IS NOT NULL AND prev_close != 0 THEN 
                ((close - prev_close) / prev_close) * 100
            ELSE NULL
        END AS daily_return,

        -- Volume ratio compared to rolling average
        CASE 
            WHEN avg_volume_5 IS NOT NULL AND avg_volume_5 != 0 THEN 
                volume / avg_volume_5
            ELSE NULL
        END AS volume_ratio,

        -- Rolling volatility based on daily return
        STDDEV(
            CASE 
                WHEN prev_close IS NOT NULL AND prev_close != 0 THEN 
                    ((close - prev_close) / prev_close) * 100
                ELSE NULL
            END
        ) OVER (
            PARTITION BY symbol 
            ORDER BY datetime 
            ROWS BETWEEN 9 PRECEDING AND CURRENT ROW
        ) AS rolling_volatility_10,

        -- Sector classification based on symbol 
        CASE
            WHEN symbol IN ('AAPL', 'CRM', 'CSCO', 'IBM', 'INTC', 'MSFT') THEN 'Technology'
            WHEN symbol IN ('AMGN', 'JNJ', 'MRK', 'UNH') THEN 'Healthcare'
            WHEN symbol IN ('AXP', 'GS', 'JPM', 'TRV', 'V') THEN 'Financials'
            WHEN symbol IN ('BA', 'CAT', 'HON', 'MMM') THEN 'Industrials'
            WHEN symbol IN ('CVX') THEN 'Energy'
            WHEN symbol IN ('DIS', 'VZ') THEN 'Communication Services'
            WHEN symbol IN ('DOW') THEN 'Materials'
            WHEN symbol IN ('HD', 'MCD', 'NKE') THEN 'Consumer Discretionary'
            WHEN symbol IN ('KO', 'PG', 'WMT', 'WBA') THEN 'Consumer Staples'
            ELSE 'Unknown'
        END AS sector
    FROM base
)

SELECT * FROM features
