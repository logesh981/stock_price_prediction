
  
    
    

    create  table
      "dev"."main"."read_csv__dbt_tmp"
  
    as (
      



-- Read all stocks from all symbols and dates
SELECT 
    json_extract_string(value, '$.symbol') AS symbol,
    json_extract_string(value, '$.datetime') AS datetime,
    json_extract_double(value, '$.open') AS open,
    json_extract_double(value, '$.high') AS high,
    json_extract_double(value, '$.low') AS low,
    json_extract_double(value, '$.close') AS close,
    json_extract_double(value, '$.volume') AS volume
FROM 
    read_ndjson_auto('s3://my-stock-data-bucket/stocks/CVX/2025/4/13/CVX_20250413_113945_jz58k4.json')
    );
  
  