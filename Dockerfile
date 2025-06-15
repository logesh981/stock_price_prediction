# Use a lightweight Python image
FROM python:3.10-slim


WORKDIR /app


COPY Pipfile Pipfile.lock ./


RUN pip install pipenv && pipenv install --system --deploy

COPY . .

# Expose the FastAPI port
EXPOSE 8000

# Run the FastAPI app defined in predict.py (with app = FastAPI())
CMD ["uvicorn", "predict:app", "--host", "0.0.0.0", "--port", "8000"]
