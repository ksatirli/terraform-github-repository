# As part of the `4.0.0` rewrite of this module, all resource identifiers have been renamed from `this` to `main.`
# See https://www.terraform.io/language/modules/develop/refactoring#moved-block-syntax for more information.

moved {
  from = github_repository.this
  to   = github_repository.main
}

moved {
  from = github_branch_default.this
  to   = github_branch_default.main
}

moved {
  from = github_repository_deploy_key.this
  to   = github_repository_deploy_key.main
}

moved {
  from = github_repository_collaborator.this
  to   = github_repository_collaborator.main
}

moved {
  from = github_team_repository.this
  to   = github_team_repository.main
}

moved {
  from = github_issue_label.this
  to   = github_issue_label.main
}

moved {
  from = github_repository_project.this
  to   = github_repository_project.main
}

moved {
  from = github_repository_file.this
  to   = github_repository_file.main
}


