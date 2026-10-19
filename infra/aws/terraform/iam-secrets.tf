resource "aws_iam_role" "tenant_provisioner" {
  name = "${var.project_name}-tenant-provisioner-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "lambda.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
  tags = { Environment = var.environment }
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.tenant_provisioner.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_secretsmanager_secret" "tenant_credentials" {
  name                    = "${var.project_name}/tenant-credentials"
  description             = "Tenant credentials container; no secret values committed"
  recovery_window_in_days = 7
  tags                    = { Environment = var.environment }
}
