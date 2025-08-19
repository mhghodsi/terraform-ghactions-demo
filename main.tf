# Generate a 4-character random suffix for uniqueness
resource "random_string" "suffix" {
  length  = 4
  upper   = false
  special = false
}

# Create the demo bucket with random suffix
# module "demo_bucket" {
#   source = "./modules/s3"
  
#   bucket_name = "gh-actions-demo-bucket-${random_string.suffix.result}"
# }

# Create the user-defined bucket
module "custom_bucket" {
  source = "./modules/s3"
  # bucket_name = var.bucket_name
  bucket_name = local.bucket_name
}

# Create a GitHub repository
module "github_repo" {
  source = "./modules/github"
  
  repo_name    = "terraform-created-repo"
  description  = "This repository was created using Terraform"
  visibility   = "private"
  github_owner = var.github_owner
}
