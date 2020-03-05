output "full_name" {
  value       = github_repository.repository.full_name
  description = " A string of the form \"orgname/reponame\""
}

output "html_url" {
  value       = github_repository.repository.ssh_clone_url
  description = "URL to the repository on the web"
}

output "ssh_clone_url" {
  value       = github_repository.repository.ssh_clone_url
  description = "URL to the repository to clone via SSH"
}

output "http_clone_url" {
  value       = github_repository.repository.http_clone_url
  description = "URL to clone the repository via HTTPs"
}

output "git_clone_url" {
  value       = github_repository.repository.git_clone_url
  description = "URL to clone the repository via the git protocol"
}

output "svn_url" {
  value       = github_repository.repository.svn_url
  description = "URL to check out the repository via GitHub's Subversion protocol emulation"
}

