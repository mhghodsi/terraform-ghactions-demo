output "bucket_name" {
  description = "Name of the created S3 bucket"
  value       = var.create_bucket && var.bucket_name != "" ? module.s3_bucket[0].bucket_name : "No bucket created"
}

# output "github_repo_url" {
#   description = "URL of the created GitHub repository"
#   value       = module.github_repo.repo_url
# }

# output "github_repo_clone_url" {
#   description = "Git clone URL of the created GitHub repository"
#   value       = module.github_repo.repo_git_clone_url
# }
