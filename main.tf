# Configure the AWS provider to use the us-east-1 region
provider "aws" {
  region = "us-east-1"
}

# Generate a 4-character random suffix for uniqueness
resource "random_string" "suffix" {
  length  = 4
  upper   = false
  special = false
}

# Create an S3 bucket with the specified name
resource "aws_s3_bucket" "mybucket" {
  bucket = "gh-actions-demo-bucket-${random_string.suffix.result}"
}

# Set the access control list (ACL) for the S3 bucket to private
# resource "aws_s3_bucket_acl" "mybucket_acl" {
#   bucket = aws_s3_bucket.mybucket.id
#   acl    = "private"
# }