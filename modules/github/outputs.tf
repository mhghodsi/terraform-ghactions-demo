output "repo_name" {
  value = github_repository.repo.name
}

output "repo_url" {
  value = github_repository.repo.html_url
}

output "repo_ssh_clone_url" {
  value = github_repository.repo.ssh_clone_url
}

output "repo_git_clone_url" {
  value = github_repository.repo.git_clone_url
}
