output "app_secret_arn" {
  value = aws_secretsmanager_secret.secret.arn
}
