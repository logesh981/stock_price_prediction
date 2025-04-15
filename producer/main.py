import json
import logging
import os
import random
import time
import signal
from typing import Dict, Any, Optional, List
from datetime import datetime, timezone, timedelta
from random import randint

import yfinance as yf
from confluent_kafka import Producer
from dotenv import load_dotenv
from faker import Faker
from jsonschema import validate, ValidationError, FormatChecker

# Configure logging
logging.basicConfig(
    format="%(asctime)s - %(levelname)s - %(module)s - %(message)s",
    level=logging.INFO
)
logger = logging.getLogger(__name__)

load_dotenv(dotenv_path="../.env")

STOCK_SCHEMA = {
    "type": "object",
    "properties": {
        "symbol": {
            "type": "string",
            "pattern": "^[A-Z]{1,5}$"
        },
        "datetime": {
            "type": "string",
            "format": "date-time"
        },
        "open": {
            "type": "number",
            "minimum": 0
        },
        "high": {
            "type": "number",
            "minimum": 0
        },
        "low": {
            "type": "number",
            "minimum": 0
        },
        "close": {
            "type": "number",
            "minimum": 0
        },
        "volume": {
            "type": "number",
            "minimum": 0
        }
    },
    "required": [
        "symbol", "datetime", "open", "high", "low", "close", "volume"
    ]
}

class StockProducer:
    def __init__(self):
        self.bootstrap_servers = os.getenv("KAFKA_BOOTSTRAP_SERVERS", "localhost:9092")
        self.kafka_username = os.getenv("KAFKA_USERNAME")
        self.kafka_password = os.getenv("KAFKA_PASSWORD")
        self.topic = os.getenv("KAFKA_TOPIC", "stock_market_data")
        self.running = False

        self.producer_config = {
            "bootstrap.servers": self.bootstrap_servers,
            "client.id": "transaction-producer",
            "compression.type": "gzip",
            "linger.ms": 5,
            "batch.size": 16384,
        }

        if self.kafka_username and self.kafka_password:
            self.producer_config.update({
                "security.protocol": "SASL_SSL",
                "sasl.mechanism": "PLAIN",
                "sasl.username": self.kafka_username,
                "sasl.password": self.kafka_password,
            })
        else:
            self.producer_config["security.protocol"] = "PLAINTEXT"

        try:
            self.producer = Producer(self.producer_config)
            logger.info("Confluent Kafka Producer initialized successfully.")
        except Exception as e:
            logger.error(f"Failed to initialize Confluent Kafka Producer: {str(e)}")
            raise e
    def delivery_report(self, err, msg):
        if err is not None:
            logger.error(f"Delivery failed for record {msg.key()}: {err}")
        else:
            logger.info(f"Record sent to {msg.topic()} [{msg.partition()}]")
    
    def validate_stock_data(self, data: Dict[str, Any]) -> bool:
        try:
            validate(instance=data, schema=STOCK_SCHEMA, format_checker=FormatChecker())
            return True
        except ValidationError as e:
            logger.error(f"Invalid stock data: {e.message}")
            return False
    def fetch_hourly_stock_data(self, symbol: str) -> List[Dict[str, Any]]:
        end_date = datetime.today().date()
        start_date = end_date - timedelta(days=90)

        try:
            ticker = yf.Ticker(symbol)
            hist = ticker.history(start=start_date.isoformat(),
                                  end=end_date.isoformat(),
                                  interval="60m",
                                  actions=False)

            if hist.empty:
                return []

            hist = hist.between_time("09:30", "16:00")
            hist.reset_index(inplace=True)

            return [
                {
                    "symbol": symbol,
                    "datetime": row["Datetime"].isoformat(),
                    "open": float(row["Open"]),
                    "high": float(row["High"]),
                    "low": float(row["Low"]),
                    "close": float(row["Close"]),
                    "volume": int(row["Volume"]),
                }
                for _, row in hist.iterrows()
            ]
        except Exception as e:
            logger.error(f"Error fetching stock data for {symbol}: {str(e)}")
            return []
    def produce_stock_data(self, stock_data: Dict[str, Any]):
        if self.validate_stock_data(stock_data):
            try:
                self.producer.produce(
                    self.topic,
                    key=stock_data["symbol"],
                    value=json.dumps(stock_data),
                    callback=self.delivery_report
                )
                self.producer.poll(0)
            except Exception as e:
                logger.error(f"Failed to produce stock data: {str(e)}")
    def run_production(self, symbols: List[str], interval: float = 1.0):
        self.running = True
        logger.info(f"Producing historical hourly stock data for {symbols}")

        try:
            for symbol in symbols:
                hourly_data = self.fetch_hourly_stock_data(symbol)
                for row in hourly_data:
                    self.produce_stock_data(row)
                    time.sleep(interval)  # simulate stream with delay
        finally:
            self.shutdown()
    def shutdown(self):
        if self.running:
            logger.info("Shutting down Stock Producer...")
            self.running = False
            if self.producer:
                self.producer.flush(timeout=30)

if __name__ == "__main__":
    producer = StockProducer()
    dow_jones_symbols = [
        "AAPL", "AMGN", "AXP", "BA", "CAT", "CRM", "CSCO", "CVX", "DIS", "DOW",
        "GS", "HD", "HON", "IBM", "INTC", "JNJ", "JPM", "KO", "MCD", "MMM",
        "MRK", "MSFT", "NKE", "PG", "TRV", "UNH", "V", "VZ", "WBA", "WMT"
    ]
    producer.run_production(symbols=dow_jones_symbols, interval=0.5)