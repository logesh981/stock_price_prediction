from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from model import ModelService, load_production_model

# Define the input data schema
class StockInput(BaseModel):
    open: float
    high: float
    low: float
    volume: int
    rolling_avg_5: float
    rolling_std_5: float
    daily_range: float
    avg_volume_5: float
    daily_return: float
    volume_ratio: float
    rolling_volatility_10: float



# Load the production model
model = load_production_model()
model_service = ModelService(model)

# Initialize FastAPI app
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
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
