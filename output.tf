output "github_repository" {
  description = "Exported Attributes for `github_repository`."
  value       = github_repository.main
}

output "github_branch" {
  description = "Exported Attributes for `github_branch`."
  value       = github_branch.main
}

output "github_branch_default" {
  description = "Exported Attributes for `github_branch_default`."
  value       = github_branch_default.main
}

output "github_branch_protection_v3" {

  description = "Exported Attributes for `github_branch_protection_v3`."
  value       = github_branch_protection_v3.main
}

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

# TOOD: define a good way to make this useful for consumption
output "repository_collaborator_invitation_ids" {
  description = "ID of the invitation to be used in `github_user_invitation_accepter`."
  value       = github_repository_collaborator.main[*].invitation_id
}

