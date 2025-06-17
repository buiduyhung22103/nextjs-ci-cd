output "frontend_public_ip" {
  description = "Public IP của FE instance"
  value       = aws_instance.frontend.public_ip
}

output "backend_private_ip" {
  description = "Private IP của BE instance"
  value       = aws_instance.backend.private_ip
}

output "rds_endpoint" {
  description = "Endpoint của RDS MySQL"
  value       = aws_db_instance.mysql.address
}
