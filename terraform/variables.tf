variable "region" {
  description = "AWS region to deploy EC2 instance in"
  default     = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID for Ubuntu 24.04 in us-east-1"
  default     = "ami-084568db4383264d4"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the SSH key pair to use"
  default     = "deploy_key"
}

variable "public_key_path" {
  description = "Path to your public SSH key"
  default     = "../.ssh/deploy_key.pub"
}

variable "ecr_uri" {
  description = "URI of the ECR image to deploy"
  default     = "084828586121.dkr.ecr.us-east-1.amazonaws.com/stockapi"
}

variable "mlflow_uri" {
  description = "MLflow tracking server URI"
  type        = string
  default = "http://ec2-3-89-152-136.compute-1.amazonaws.com:5000"
}