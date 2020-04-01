##
# outputs for `github_repository`
##
output "full_name" {
  value       = "${github_repository.repository.full_name}"
  description = "A string of the form `orgname/reponame`."
}

output "ssh_clone_url" {
  value       = "${github_repository.repository.ssh_clone_url}"
  description = "URL that can be provided to `git clone` to clone the repository via SSH."
}

output "http_clone_url" {
  value       = "${github_repository.repository.http_clone_url}"
  description = "URL that can be provided to `git clone` to clone the repository via HTTPS."
}

output "git_clone_url" {
  value       = "${github_repository.repository.git_clone_url}"
  description = "URL that can be provided to git clone to clone the repository anonymously via the git protocol."
}

output "svn_url" {
  value       = "${github_repository.repository.svn_url}"
  description = "URL that can be provided to `svn checkout` to check out the repository via GitHub's Subversion protocol emulation."
}
