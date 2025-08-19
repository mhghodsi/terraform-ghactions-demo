variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket to create (without environment prefix)"
  type        = string
  default     = ""
}

variable "create_bucket" {
  description = "Whether to create the bucket"
  type        = bool
  default     = true
}

variable "bucket_acl" {
  description = "ACL for the S3 bucket"
  type        = string
  default     = "private"
}

variable "github_token" {
  description = "GitHub personal access token"
  type        = string
  sensitive   = true
}

variable "github_owner" {
  description = "GitHub owner/organization name"
  type        = string
  default     = "mhghodsi"  # Your GitHub username based on repo context
}
