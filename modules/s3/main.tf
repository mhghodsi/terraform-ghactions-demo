resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}

# Uncomment and update if needed
# resource "aws_s3_bucket_acl" "bucket_acl" {
#   bucket = aws_s3_bucket.bucket.id
#   acl    = var.acl
# }