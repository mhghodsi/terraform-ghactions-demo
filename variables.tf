variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "buckets" {
  description = "Map of bucket names to their configuration"
  type        = map(object({
    create = bool
    acl    = optional(string, "private")
  }))
  default     = {}
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
