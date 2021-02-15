output "name" {
  value       = github_repository.this.name
  description = "A string of the form \"reponame\""
}

output "full_name" {
  value       = github_repository.this.full_name
  description = "A string of the form \"orgname/reponame\""
}

output "html_url" {
  value       = github_repository.this.ssh_clone_url
  description = "URL to the repository on the web"
}

output "ssh_clone_url" {
  value       = github_repository.this.ssh_clone_url
  description = "URL to the repository to clone via SSH"
}

output "http_clone_url" {
  value       = github_repository.this.http_clone_url
  description = "URL to clone the repository via HTTPs"
}

output "git_clone_url" {
  value       = github_repository.this.git_clone_url
  description = "URL to clone the repository via the git protocol"
}

output "svn_url" {
  value       = github_repository.this.svn_url
  description = "URL to check out the repository via GitHub's Subversion protocol emulation"
}

// TOOD: define a good way to make this useful for consumption
//output "repository_collaborator_invitation_id" {
//  value       = github_repository_collaborator.this[*].invitation_id
//  description = "ID of the invitation to be used in `github_user_invitation_accepter`"
//}

output "project_ids" {
  value       = github_repository_project.this[*].id
  description = "List of Repository Project IDs"
}

output "project_urls" {
  value       = github_repository_project.this[*].url
  description = "List of Repository Project IDs"
}

output "projects" {
  value       = zipmap(github_repository_project.this[*].id, github_repository_project.this[*].url)
  description = "Map of Repository Project IDs, and corresponding URLs"
}

output "files" {
  value       = zipmap(github_repository_file.this[*].file, github_repository_file.this[*].sha)
  description = "Map of Repository File names and corresponding SHA blobs"
}
