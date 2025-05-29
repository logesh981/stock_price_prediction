import os
import pandas as pd
import mlflow
import boto3
from dotenv import load_dotenv

load_dotenv()

s3_client = boto3.client(
    's3',
    aws_access_key_id=os.getenv("AWS_ACCESS_KEY_ID"),
    aws_secret_access_key=os.getenv("AWS_SECRET_ACCESS_KEY"),
    region_name=os.getenv("us-east-1"),
)


class ModelService:
    def __init__(self,model,model_version = None):
        self.model = model
        self.model_version = model_version

    def predict(self, features):
        if isinstance(features, dict):
            features = [features]
        pd_features = pd.DataFrame(features)
        pred = self.model.predict(pd_features)
        return pred
    
def load_production_model(model_name="StockPricePredictor"):
    tracking_uri = os.getenv("MLFLOW_TRACKING_URI")
    mlflow.set_tracking_uri(tracking_uri)

    model_uri = f"models:/{model_name}/Production"
    model = mlflow.xgboost.load_model(model_uri)
    return model

