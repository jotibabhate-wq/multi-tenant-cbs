# Multi-Tenant CBS on Laravel + AWS — DevOps Starter Kit
## CI/CD Status

- Terraform Validate: Passing
- Python Checks: Passing

## Project Architecture

GitHub Repository → GitHub Actions → Terraform Format → Terraform Init → Terraform Validate

AWS resources are not deployed automatically. Infrastructure deployment requires a separate manual review and approval.
Configuration/infrastructure starter only; it does not contain a website or a complete CBS backend.

## Included
- Terraform skeleton for VPC, subnets, routing, security groups, ECR, ECS, ALB, optional Aurora, IAM and Secrets Manager.
- GitHub Actions workflows for Terraform validation and Python syntax checks.
- Python Lambda request-validation starter.
- OpenAPI contract, SQL and Flyway templates.

## Validate
Install Terraform CLI and Python 3.11+:
```bash
terraform -chdir=infra/aws/terraform fmt -recursive
terraform -chdir=infra/aws/terraform init -backend=false
terraform -chdir=infra/aws/terraform validate
python -m py_compile lambdas/provision_tenant/lambda_function.py
```

No workflow deploys AWS resources. Review all files before use. AWS resources such as ALB and Aurora can incur charges. This starter does not implement actual tenant provisioning, billing, suspension, or production-grade isolation.


## Architecture

```text
Developer
   |
   v
GitHub Repository
   |
   v
GitHub Actions
   |
   +--> Terraform Format Check
   |
   +--> Terraform Init
   |
   +--> Terraform Validate
   |
   +--> Python Syntax Check
   |
   v
Validation Results
```

### AWS Infrastructure Templates

The Terraform configuration provides starter templates for:

- VPC, public/private subnets and routing
- ECS Fargate and Application Load Balancer
- ECR container registry
- IAM roles and Secrets Manager
- CloudWatch logging

### Current Project Status

- GitHub Actions workflows pass validation checks.
- Terraform configuration initializes and validates locally.
- AWS resources have **not** been deployed.
- Tenant provisioning, billing, suspension and production-grade isolation require further implementation.

### Cost and Security

Review the Terraform plan and estimate AWS costs before deployment. Never commit AWS access keys, secret keys or other credentials to this repository.
