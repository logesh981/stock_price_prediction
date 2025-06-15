import pytest
from fastapi.testclient import TestClient
from predict import app

client = TestClient(app)

def test_read_root():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"message": "Stock Prediction API is running"}

def test_predict_valid_input():
    valid_payload = {
        "open": 170.0,
        "high": 172.0,
        "low": 168.5,
        "volume": 15000000,
        "rolling_avg_5": 171.2,
        "rolling_std_5": 1.3,
        "daily_range": 3.5,
        "avg_volume_5": 14500000,
        "daily_return": 0.5,
        "volume_ratio": 1.05,
        "rolling_volatility_10": 1.2
    }
    response = client.post("/predict", json=valid_payload)
    assert response.status_code == 200
    assert "predicted_price" in response.json()

def test_predict_missing_field():
    payload = {
        "open": 170.0,
        "high": 172.0,
        # missing 'low', etc.
    }
    response = client.post("/predict", json=payload)
    assert response.status_code == 422  # validation error

def test_predict_negative_value():
    payload = {
        "open": -100.0,  # invalid
        "high": 172.0,
        "low": 168.5,
        "volume": 15000000,
        "rolling_avg_5": 171.2,
        "rolling_std_5": 1.3,
        "daily_range": 3.5,
        "avg_volume_5": 14500000,
        "daily_return": 0.5,
        "volume_ratio": 1.05,
        "rolling_volatility_10": 1.2
    }
    response = client.post("/predict", json=payload)
    assert response.status_code == 422
    assert "greater than 0" in response.text

def test_predict_low_higher_than_high():
    payload = {
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
    response = client.post("/predict", json=payload)
    assert response.status_code == 422
    assert "Low price cannot be greater than High price" in response.text
