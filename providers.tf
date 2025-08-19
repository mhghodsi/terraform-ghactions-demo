terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.7.2"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.45.0"
    }
  }
  required_version = ">= 1.0.0"
}

# Configure the AWS provider
provider "aws" {
  region = var.aws_region
}

# Configure the GitHub provider
provider "github" {
  token = var.github_token
  owner = var.github_owner
}