from fastapi import FastAPI, HTTPException
from pydantic import BaseModel, Field, field_validator
from api.model import ModelService, load_production_model

# Defining the input data schema with validation
class StockInput(BaseModel):
    open: float = Field(gt=0, description="Opening price must be greater than 0")
    high: float = Field(gt=0, description="High price must be greater than 0")
    low: float = Field(gt=0, description="Low price must be greater than 0")
    volume: int = Field(gt=0, description="Volume must be a positive integer")
    rolling_avg_5: float = Field(gt=0, description="Rolling average must be greater than 0")
    rolling_std_5: float = Field(ge=0, description="Rolling std deviation must be non-negative")
    daily_range: float = Field(ge=0, description="Daily range must be non-negative")
    avg_volume_5: float = Field(gt=0, description="Average volume must be positive")
    daily_return: float = Field(description="Daily return")
    volume_ratio: float = Field(gt=0, description="Volume ratio must be positive")
    rolling_volatility_10: float = Field(ge=0, description="Volatility must be non-negative")

    @field_validator('low')
    def low_must_be_less_than_high(cls, v, values):
        high = values.get('high')
        if high is not None and v > high:
            raise ValueError('Low price cannot be greater than High price')
        return v


model = load_production_model()
model_service = ModelService(model)

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Stock Prediction API is running"}

@app.post("/predict")
def predict_stock(data: StockInput):
    try:
        input_dict = data.dict()
        prediction = model_service.predict(input_dict)
        return {"predicted_price": float(prediction[0])}
    except ValueError as ve:
        raise HTTPException(status_code=400, detail=f"Value Error: {str(ve)}")
    except KeyError as ke:
        raise HTTPException(status_code=422, detail=f"Missing or invalid key: {str(ke)}")
    except Exception:
        raise HTTPException(status_code=500, detail="An unexpected error occurred while processing the request.")
