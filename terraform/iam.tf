resource "aws_iam_role" "ec2_instance_role" {
  name = "ec2-ecr-access-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "attach_ecr_readonly" {
  role       = aws_iam_role.ec2_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2-ecr-profile"
  role = aws_iam_role.ec2_instance_role.name
}
resource "aws_iam_policy" "mlflow_artifact_read" {
  name        = "mlflow-artifact-read-policy"
  description = "Allow EC2 to read MLflow artifacts from S3"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ],
        Resource = [
          "arn:aws:s3:::mlflow-artifacts-remote23",
          "arn:aws:s3:::mlflow-artifacts-remote23/*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_mlflow_artifact_read" {
  role       = aws_iam_role.ec2_instance_role.name
  policy_arn = aws_iam_policy.mlflow_artifact_read.arn
}