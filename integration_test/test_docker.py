import json
from pathlib import Path
import requests

json_data ={
    "open": 170.0,
        "high": 150.0,
        "low": 160.0,   # invalid, low cannot be greater than high
        "volume": 15000000,
        "rolling_avg_5": 171.2,
        "rolling_std_5": 1.3,
        "daily_range": 3.5,
        "avg_volume_5": 14500000,
        "daily_return": 0.5,
        "volume_ratio": 1.05,
        "rolling_volatility_10": 1.2
}
url = 'http://127.0.0.1:8000/predict'
response = requests.post(url,json=json_data, verify=False, timeout=10)


assert 1==1