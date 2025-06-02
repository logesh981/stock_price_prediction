#!/bin/bash

# Install Docker
sudo apt update -y
sudo apt install -y docker.io
sudo systemctl start docker
sudo usermod -aG docker ubuntu

sudo apt install -y unzip curl gnupg apt-transport-https ca-certificates lsb-release software-properties-common

# Install AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# ECR login
aws ecr get-login-password --region ${region} | \
docker login --username AWS --password-stdin ${ecr_uri}
export MLFLOW_TRACKING_URI=${mlflow_uri}

# Pull and run container
docker pull ${ecr_uri}
docker run -d -p 8000:8000 -e MLFLOW_TRACKING_URI=$MLFLOW_TRACKING_URI ${ecr_uri}
