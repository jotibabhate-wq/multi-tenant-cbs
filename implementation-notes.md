# Implementation gaps before deployment

- Add remote Terraform state and locking.
- Add NAT Gateway/private route tables or appropriate VPC endpoints for private tasks.
- Add ACM certificate, HTTPS listener, Route 53 records and wildcard tenant routing.
- Add ECR push permissions to CI using GitHub OIDC and least privilege.
- Add Lambda resource, packaging, VPC config if required, SQS/DLQ and event mapping.
- Implement actual tenant provisioning and control DB metadata updates.
- Implement tenant-specific database connection resolution and isolation tests in backend.
- Implement billing integration, signature verification, idempotency, grace period and suspension state machine.
- Add CUR/Athena/QuickSight cost attribution.
- Confirm Aurora engine/instance availability, quotas and costs in the selected region.
- Test in a non-production AWS account. Do not apply without review.
