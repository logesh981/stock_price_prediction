import boto3
from urllib.parse import quote_plus

# MinIO config
MINIO_ENDPOINT = "http://localhost:9000"
ACCESS_KEY = "minioadmin"
SECRET_KEY = "minioadmin"
BUCKET_NAME = "my-stock-data-bucket"
PREFIX = "stocks/"
OUTPUT_MODEL = "models/staging/stg_stock_data.sql"
BASE_URL = f"{MINIO_ENDPOINT}/{BUCKET_NAME}"

s3 = boto3.client(
    's3',
    endpoint_url=MINIO_ENDPOINT,
    aws_access_key_id=ACCESS_KEY,
    aws_secret_access_key=SECRET_KEY,
    region_name='us-east-1'
)

paginator = s3.get_paginator("list_objects_v2")
pages = paginator.paginate(Bucket=BUCKET_NAME, Prefix=PREFIX)

queries = []

for page in pages:
    if "Contents" in page:
        for obj in page["Contents"]:
            key = obj["Key"]
            if key.endswith(".json"):
                encoded_key = quote_plus(key).replace('%2F', '/')
                url = f"{BASE_URL}/{encoded_key}"
                queries.append(f"SELECT * FROM read_json_auto('{url}')")

# Write full dbt model
with open(OUTPUT_MODEL, "w") as f:
    f.write("{{ config(materialized = 'view') }}\n\n")
    f.write("WITH raw AS (\n")
    f.write("    " + "\n    UNION ALL\n    ".join(queries) + "\n")
    f.write(")\n\n")
    f.write("""SELECT
    CAST(symbol AS TEXT) AS symbol,
    CAST(datetime AS TIMESTAMP) AS datetime,
    CAST(open AS DOUBLE) AS open,
    CAST(high AS DOUBLE) AS high,
    CAST(low AS DOUBLE) AS low,
    CAST(close AS DOUBLE) AS close,
    CAST(volume AS BIGINT) AS volume
FROM raw
WHERE symbol IS NOT NULL AND datetime IS NOT NULL
""")

print(f"✔ Generated model at {OUTPUT_MODEL}")
