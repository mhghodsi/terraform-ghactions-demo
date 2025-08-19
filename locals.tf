locals {
  ws              = lower(terraform.workspace)
  valid_workspace = contains(["dev", "prod"], local.ws) ? local.ws : "default"
  prefix          = "${local.valid_workspace}-"

  # sanitize bucket base
  bucket_base_1         = lower(var.bucket_name)
  bucket_base_2         = replace(local.bucket_base_1, " ", "-")
  bucket_base_3         = replace(local.bucket_base_2, "_", "-")
  bucket_base_4         = replace(local.bucket_base_3, "--", "-")
  formatted_bucket_name = "${local.prefix}${local.bucket_base_4}"
}
