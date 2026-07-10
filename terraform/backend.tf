# S3 backend configuration for remote state management
#
# IMPORTANT: Follow these steps to enable remote state:
#
# 1. First run: terraform init (without backend configured)
# 2. Apply infrastructure: terraform apply
# 3. Create an S3 bucket for Terraform state (you can use the AWS CLI or console)
# 4. Create a DynamoDB table for state locking (optional but recommended):
#    - Table name: terraform-locks
#    - Primary key: LockID (String)
# 5. Uncomment the backend block below
# 6. Run: terraform init -migrate-state
#    This will migrate your local state to the S3 backend
#
# Bucket naming convention: {project-name}-terraform-state-{account-id}

# terraform {
#   backend "s3" {
#     bucket         = "portfolio-site-terraform-state-ACCOUNT_ID"
#     key            = "prod/terraform.tfstate"
#     region         = "ap-south-1"
#     encrypt        = true
#     dynamodb_table = "terraform-locks"
#   }
# }
