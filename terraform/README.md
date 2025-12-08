Terraform setup for ShopingKaro: provisions ECR, ECS (Fargate + ALB), and Amazon DocumentDB using an existing VPC.

Prerequisites
- Terraform 1.0+
- AWS account and credentials configured (either environment variables or GitHub Actions OIDC role)

Quick start
1. cd terraform
2. terraform init
3. terraform plan -var 'aws_region=us-east-1'
4. terraform apply -var 'aws_region=us-east-1'

Notes
- This configuration expects an existing VPC. Provide `-var 'vpc_id=<vpc-id>' -var 'public_subnet_ids=["subnet-aaa","subnet-bbb"]' -var 'private_subnet_ids=["subnet-ccc","subnet-ddd"]'` when running `plan`/`apply`.
- This configuration expects an existing VPC. Provide `-var 'vpc_id=<vpc-id>' -var 'public_subnet_ids=["subnet-aaa","subnet-bbb"]' -var 'private_subnet_ids=["subnet-ccc","subnet-ddd"]'` when running `plan`/`apply`.
- To enable HTTPS on the ALB and redirect HTTP → HTTPS, supply an ACM certificate ARN via `-var 'acm_certificate_arn=arn:aws:acm:...:certificate/xxxx'` (certificate must be in the same region as the ALB).
- The ECS task definition uses the ECR image `:latest` by default. The CI pipeline should push an image to the ECR repository (or GHCR) and you may update the task definition image after builds, or adjust CI to register task definitions as shown in the GitHub Actions workflow.
- DocumentDB is created in the private subnets. The output `mongo_connection_string` contains the connection URI.
