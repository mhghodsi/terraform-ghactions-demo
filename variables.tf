variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket to create"
  type        = string
}

variable "enable_cloudfront" {
  description = "Whether to enable CloudFront distributions"
  type        = bool
  default     = false
}