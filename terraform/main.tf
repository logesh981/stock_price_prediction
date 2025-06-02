provider "aws" {
  region = var.region
}

resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

resource "aws_security_group" "allow_web_ssh" {
  name        = "allow_web_ssh"
  description = "Allow HTTP and SSH"

  ingress {
    description = "Allow HTTP"
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "stock_api" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.deployer.key_name
  vpc_security_group_ids      = [aws_security_group.allow_web_ssh.id]
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.ec2_instance_profile.name
  user_data = templatefile("${path.module}/user_data/startup.sh.tpl", {
    region  = var.region,
    ecr_uri = var.ecr_uri
    mlflow_uri  = var.mlflow_uri
  })

  tags = {
    Name = "StockPredictionAPI"
  }
} 
