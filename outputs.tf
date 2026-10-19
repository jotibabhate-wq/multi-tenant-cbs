output "vpc_id" {
  value       = aws_vpc.main.id
  description = "VPC ID"
}
output "ecr_repository_url" {
  value       = aws_ecr_repository.app.repository_url
  description = "ECR repository URL"
}
output "alb_dns_name" {
  value       = aws_lb.main.dns_name
  description = "ALB DNS name"
}
output "aurora_endpoint" {
  value       = try(aws_rds_cluster.control[0].endpoint, null)
  description = "Aurora endpoint when create_database=true"
}
