terraform {
  backend "s3" {
    bucket               = "hgh-terraform-state"
    key                  = "snowflake/infra.tfstate"
    region               = "us-east-1"
    workspace_key_prefix = "env"
    use_lockfile         = true   # replaces dynamodb_table
  }
}