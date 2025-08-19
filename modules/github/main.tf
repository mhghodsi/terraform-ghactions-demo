resource "github_repository" "repo" {
  name        = var.repo_name
  description = var.description
  visibility  = var.visibility

  auto_init = true

  dynamic "template" {
    for_each = var.template_repo != "" ? [1] : []
    content {
      owner      = var.github_owner
      repository = var.template_repo
    }
  }
}
