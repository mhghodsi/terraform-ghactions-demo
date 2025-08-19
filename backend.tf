terraform {
  backend "s3" {
    bucket               = "hgh-terraform-state"
    region               = "us-east-1"
    key                  = "infra.tfstate"          # constant file name
    workspace_key_prefix = "terraform/state/demo"   # folder/prefix you choose
    dynamodb_table       = "terraform-locks"        # recommended for state locking
    encrypt              = true
    # kms_key_id         = "alias/terraform"        # optional: SSE-KMS
  }
}
