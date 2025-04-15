import json
import logging
import os
import signal
import sys
import time
import random
import string
from typing import List
from datetime import datetime

from confluent_kafka import Consumer, KafkaError
from dotenv import load_dotenv
import boto3

# Load environment variables
load_dotenv(dotenv_path="../.env")

# Logging setup
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("StockConsumer")

# S3 config
s3_bucket = os.getenv("S3_BUCKET_NAME", "my-stock-data-bucket")
s3_prefix = "stocks"

# Kafka config
kafka_config = {
    "bootstrap.servers": os.getenv("KAFKA_BOOTSTRAP_SERVERS", "localhost:9092"),
    "group.id": "stock-consumer-group",
    "auto.offset.reset": "earliest"
}

# Add security config if needed
if os.getenv("KAFKA_USERNAME") and os.getenv("KAFKA_PASSWORD"):
    kafka_config.update({
        "security.protocol": "SASL_SSL",
        "sasl.mechanism": "PLAIN",
        "sasl.username": os.getenv("KAFKA_USERNAME"),
        "sasl.password": os.getenv("KAFKA_PASSWORD")
    })

topic = os.getenv("KAFKA_TOPIC", "stock_market_data")

class StockConsumer:
    def __init__(self):
        self.consumer = Consumer(kafka_config)
        self.running = True
        self.buffer: List[str] = []

        self.s3 = boto3.client(
            "s3",
            aws_access_key_id=os.getenv("MINIO_ACCESS_KEY"),
            aws_secret_access_key=os.getenv("MINIO_SECRET_KEY"),
            endpoint_url="http://minio:9000",  # or your Docker hostname
            config=boto3.session.Config(signature_version='s3v4'),
            region_name="us-east-1"
        )

    def handle_shutdown(self, *args):
        self.running = False
        self.consumer.close()
        logger.info("Consumer shutdown gracefully.")

    def upload_to_s3(self, data: List[str], symbol: str):
        if not data:
            return

        now = datetime.utcnow()
        rand_suffix = ''.join(random.choices(string.ascii_lowercase + string.digits, k=6))
        file_name = f"{symbol}_{now.strftime('%Y%m%d_%H%M%S')}_{rand_suffix}.json"
        local_path = f"/tmp/{file_name}"
        s3_key = f"{s3_prefix}/{symbol}/{now.year}/{now.month}/{now.day}/{file_name}"

        with open(local_path, "w") as f:
            f.write("\n".join(data))

        try:
            self.s3.upload_file(local_path, s3_bucket, s3_key)
            logger.info(f"Uploaded {len(data)} records to s3://{s3_bucket}/{s3_key}")
        except Exception as e:
            logger.error(f"Error uploading to S3: {e}")
        os.remove(local_path)

    def consume(self):
        self.consumer.subscribe([topic])
        signal.signal(signal.SIGINT, self.handle_shutdown)
        signal.signal(signal.SIGTERM, self.handle_shutdown)

        logger.info("Consumer started. Waiting for messages...")

        flush_interval = 60  # seconds
        last_flush_time = time.time()
        symbol_data_map = {}

        try:
            while self.running:
                msg = self.consumer.poll(1.0)

                if msg is None:
                    continue
                if msg.error():
                    if msg.error().code() != KafkaError._PARTITION_EOF:
                        logger.error(f"Kafka error: {msg.error()}")
                    continue

                try:
                    record = json.loads(msg.value().decode("utf-8"))
                    symbol = record["symbol"]
                    symbol_data_map.setdefault(symbol, []).append(json.dumps(record))

                except Exception as e:
                    logger.warning(f"Could not process message: {e}")

                # Time to flush?
                if time.time() - last_flush_time > flush_interval:
                    for sym, data in symbol_data_map.items():
                        self.upload_to_s3(data, sym)
                    symbol_data_map.clear()
                    last_flush_time = time.time()

        finally:
            self.consumer.close()
            logger.info("Kafka consumer closed.")

if __name__ == "__main__":
    consumer = StockConsumer()
    consumer.consume()
