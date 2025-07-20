resource "aws_secretsmanager_secret" "secret" {
  name        = var.app_secret_name
  description = "Secret managed by Terraform"
}

resource "aws_secretsmanager_secret_version" "secret-value" {
  secret_id     = aws_secretsmanager_secret.secret.id
  secret_string = var.app_secret_string
}
