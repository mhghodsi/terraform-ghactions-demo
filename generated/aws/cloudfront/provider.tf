provider "aws" {}

terraform {
	required_providers {
		aws = {
	    version = "~> 6.4.0"
		}
  }
}
