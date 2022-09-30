output "github_repository" {
  description = "Exported Attributes for `github_repository`."
  value       = github_repository.main
}

# TODO: enable when resource is enabled
#output "github_branch" {
#  description = "Exported Attributes for `github_branch`."
#  value       = github_branch.main
#}

# TODO: enable when resource is enabled
#output "github_branch_default" {
#  description = "Exported Attributes for `github_branch_default`."
#  value       = github_branch_default.main
#}

# TODO: enable when resource is enabled
#output "github_branch_protection" {
#  description = "Exported Attributes for `github_branch_protection`."
#  value       = github_branch_protection.main
#}

output "github_repository_deploy_key" {
  description = "Exported Attributes for `github_repository_deploy_key`."
  value       = github_repository_deploy_key.main
}

output "github_repository_collaborator" {
  description = "Exported Attributes for `github_repository_collaborator`."
  value       = github_repository_collaborator.main
}

output "github_team_repository" {
  description = "Exported Attributes for `github_team_repository`."
  value       = github_team_repository.main
}

output "github_issue_label" {
  description = "Exported Attributes for `github_issue_label`."
  value       = github_issue_label.main
}

output "github_repository_project" {
  description = "Exported Attributes for `github_repository_project`."
  value       = github_repository_project.main
}

output "github_repository_file" {
  description = "Exported Attributes for `github_repository_file`."
  value       = github_repository_file.main
}

output "github_repository_webhook" {
  description = "Exported Attributes for `github_repository_webhook`."
  value       = github_repository_webhook.main
}
