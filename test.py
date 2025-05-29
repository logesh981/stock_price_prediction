import boto3

s3 = boto3.client('s3',
    endpoint_url='http://localhost:9000',
    aws_access_key_id='minioadmin',
    aws_secret_access_key='minioadmin'
)

response = s3.list_objects_v2(
    Bucket='my-stock-data-bucket',
    Prefix='stocks/CVX/2025/4/13/'
)

for obj in response.get('Contents', []):
    print(obj['Key'])
