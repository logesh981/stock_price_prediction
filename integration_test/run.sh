#!/usr/bin/env bash
set -euo pipefail

# Navigate to the directory containing the script
cd "$(dirname "$0")"

# # Tag Docker image with timestamp
# LOCAL_TAG=$(date +"%Y-%m-%d-%H-%M")
# export LOCAL_IMAGE_NAME="stock_api:${LOCAL_TAG}"


echo "[INFO] Starting Docker Compose services"
docker-compose -f ../docker-compose.api.yaml up -d

echo "[INFO] Running integration tests"
if pipenv run python test_docker.py; then
    echo "[INFO] Tests passed. Shutting down containers."
    docker-compose down
else
    echo "[ERROR] Tests failed. Showing logs..."
    docker-compose -f ../docker-compose.api.yaml logs
    docker-compose -f ../docker-compose.api.yaml down
    exit 1
fi
