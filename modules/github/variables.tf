variable "repo_name" {
  description = "Name of the GitHub repository to create"
  type        = string
}

variable "description" {
  description = "Description of the GitHub repository"
  type        = string
  default     = "Repository created with Terraform"
}

variable "visibility" {
  description = "Visibility of the repository (public or private)"
  type        = string
  default     = "private"
}

variable "template_repo" {
  description = "Name of template repository to use (if any)"
  type        = string
  default     = ""
}

variable "github_owner" {
  description = "GitHub owner/organization name"
  type        = string
}
