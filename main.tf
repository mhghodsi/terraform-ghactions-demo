# Configure the AWS provider to use the us-east-1 region
provider "aws" {
  region = "us-east-1"
}

# Create an S3 bucket with the specified name
resource "aws_s3_bucket" "mybucket" {
  bucket = "gh-actions-demo-bucket-hossein"
}

# Set the access control list (ACL) for the S3 bucket to private
# resource "aws_s3_bucket_acl" "mybucket_acl" {
#   bucket = aws_s3_bucket.mybucket.id
#   acl    = "private"
# }