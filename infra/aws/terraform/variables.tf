variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project name prefix"
  type        = string
  default     = "multi-tenant-cbs"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "db_instance_class" {
  description = "Aurora instance class; confirm region availability"
  type        = string
  default     = "db.t3.medium"
}

variable "create_database" {
  description = "Create Aurora resources (may incur charges)"
  type        = bool
  default     = false
}
