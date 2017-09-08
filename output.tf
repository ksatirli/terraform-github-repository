##
# outputs for `github_repository`
##
output "full_name" {
  value = "${github_repository.repository.full_name}"
}

output "ssh_clone_url" {
  value = "${github_repository.repository.ssh_clone_url}"
}

output "http_clone_url" {
  value = "${github_repository.repository.http_clone_url}"
}

output "git_clone_url" {
  value = "${github_repository.repository.git_clone_url}"
}

output "svn_url" {
  value = "${github_repository.repository.svn_url}"
}

##
# outputs for `github_branch_protection`
##


# This resource currently has no outputs
