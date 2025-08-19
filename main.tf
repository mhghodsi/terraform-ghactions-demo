# Generate a 4-character random suffix for uniqueness
resource "random_string" "suffix" {
  length  = 4
  upper   = false
  special = false
}

# Create a single S3 bucket if create_bucket is true and bucket_name is provided
module "s3_bucket" {
  source     = "./modules/s3"
  count      = var.create_bucket && var.bucket_name != "" ? 1 : 0
  
  # Apply workspace prefix to the bucket name
  bucket_name = local.format_bucket_name(var.bucket_name)
  acl         = var.bucket_acl
}

# Create a GitHub repository
module "github_repo" {
  source = "./modules/github"
  
  repo_name    = "terraform-created-repo"
  description  = "This repository was created using Terraform"
  visibility   = "private"
  github_owner = var.github_owner
}
