output "custom_bucket_name" {
  description = "The name of the custom bucket"
  value       = module.custom_bucket.bucket_name
}

output "github_repo_url" {
  description = "URL of the created GitHub repository"
  value       = module.github_repo.repo_url
}

output "github_repo_clone_url" {
  description = "Git clone URL of the created GitHub repository"
  value       = module.github_repo.repo_git_clone_url
}
