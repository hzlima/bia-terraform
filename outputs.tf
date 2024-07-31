output "instance_id" {
  description = "ID da EC2"
  value       = aws_instance.bia-dev.id
}

output "instance_type" {
  description = "Tipo da EC2"
  value       = aws_instance.bia-dev.instance_type
}

output "instance_security_groups" {
  description = "SG da EC2"
  value       = aws_instance.bia-dev.security_groups
}

output "instance_public_id" {
  description = "IP publico da EC2"
  value       = aws_instance.bia-dev.public_ip
}

output "rds_endpoint" {
  description = "Endpoint do RDS da BIA"
  value       = aws_db_instance.bia.endpoint
}

output "rds_secrets" {
  description = "Secrets associado ao RDS"
  value       = tolist(aws_db_instance.bia.master_user_secret)[0].secret_arn
}

output "bia_repo_url" {
  description = "Endereco repositorio ECR"
  value       = aws_ecr_repository.bia.repository_url
}

output "rds_secret_name" {
  description = "Nome do meu segredo"
  value       = data.aws_secretsmanager_secret.bia_db.name
}
