provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "mybucket" {
  bucket = "gh-actions-demo-bucket-hossein"
  acl    = "private"
}