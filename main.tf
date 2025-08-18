# Generate a 4-character random suffix for uniqueness
resource "random_string" "suffix" {
  length  = 4
  upper   = false
  special = false
}

# Create the demo bucket with random suffix
module "demo_bucket" {
  source = "./modules/s3"
  
  bucket_name = "gh-actions-demo-bucket-${random_string.suffix.result}"
}

# Create the user-defined bucket
module "custom_bucket" {
  source = "./modules/s3"
  
  bucket_name = var.bucket_name
}

# Conditionally create CloudFront distributions
module "cloudfront" {
  source = "./modules/cloudfront"
  
  count = var.enable_cloudfront ? 1 : 0
  
  # Add any required parameters for CloudFront module
}