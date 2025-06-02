output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.stock_api.public_ip
}

output "ssh_command" {
  description = "SSH command to connect to EC2 instance"
  value       = "ssh -i .ssh/deploy_key ubuntu@${aws_instance.stock_api.public_ip}"
}
