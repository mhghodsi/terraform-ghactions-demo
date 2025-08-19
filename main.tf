# Generate a 4-character random suffix for uniqueness
resource "random_string" "suffix" {
  length  = 4
  upper   = false
  special = false
}

# Create S3 buckets based on the input configuration
module "buckets" {
  source     = "./modules/s3"
  for_each   = {for name, config in var.buckets : name => config if config.create}
  
  # Apply workspace prefix to each bucket name
  bucket_name = local.format_bucket_name(each.key)
  acl         = each.value.acl
}

# Create a GitHub repository
module "github_repo" {
  source = "./modules/github"
  
  repo_name    = "terraform-created-repo"
  description  = "This repository was created using Terraform"
  visibility   = "private"
  github_owner = var.github_owner
}
