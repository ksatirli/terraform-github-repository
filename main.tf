# see https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository
resource "github_repository" "main" {
  name                   = var.name
  description            = var.description
  homepage_url           = var.homepage_url
  visibility             = var.visibility
  has_issues             = var.has_issues
  has_projects           = var.has_projects
  has_wiki               = var.has_wiki
  is_template            = var.is_template
  allow_merge_commit     = var.allow_merge_commit
  allow_squash_merge     = var.allow_squash_merge
  allow_rebase_merge     = var.allow_rebase_merge
  allow_auto_merge       = var.allow_auto_merge
  delete_branch_on_merge = var.delete_branch_on_merge
  has_downloads          = var.has_downloads
  auto_init              = var.auto_init
  gitignore_template     = var.gitignore_template
  license_template       = var.license_template
  archived               = var.archived
  archive_on_destroy     = var.archive_on_destroy

  dynamic "pages" {
    for_each = length(var.pages) != 0 ? [var.pages] : []

    content {
      source {
        branch = lookup(pages.value, "branch", var.pages_branch)
        path   = lookup(pages.value, "path", null)
      }
    }
  }

  topics = var.topics

  dynamic "template" {
    for_each = length(var.template) != 0 ? [var.template] : []

    content {
      owner      = lookup(template.value, "owner", null)
      repository = lookup(template.value, "repository", null)
    }
  }

  vulnerability_alerts = var.vulnerability_alerts
}

# TODO: make this work in a sensible way
# GitHub Branches can only be created on non-empty repositories.
# see https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch
#resource "github_branch" "main" {
#  count = length(var.files) > 0 ? 1 : 0
#
#  repository = github_repository.main.name
#  branch     = var.default_branch
#}
#
## see https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_default
#resource "github_branch_default" "main" {
#  repository = github_repository.main.name
#  branch     = github_branch.main.branch
#}

# TODO
# see https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection
#resource "github_branch_protection" "main" {
#  count = length(var.branch_protections)
#
#  repository             = github_repository.main.name
#  branch                 = var.branch_protections[count.index].branch
#  enforce_admins         = var.branch_protections[count.index].enforce_admins
#  require_signed_commits = var.branch_protections[count.index].require_signed_commits
#
#  required_status_checks {
#    strict   = lookup(lookup(var.branch_protections[count.index], "required_status_checks", null), "strict", null)
#    contexts = lookup(lookup(var.branch_protections[count.index], "required_status_checks", null), "contexts", null)
#  }
#
#  required_pull_request_reviews {
#    dismiss_stale_reviews           = lookup(lookup(var.branch_protections[count.index], "required_pull_request_reviews", null), "dismiss_stale_reviews", null)
#    dismissal_users                 = lookup(lookup(var.branch_protections[count.index], "required_pull_request_reviews", null), "dismissal_users", null)
#    dismissal_teams                 = lookup(lookup(var.branch_protections[count.index], "required_pull_request_reviews", null), "dismissal_teams", null)
#    require_code_owner_reviews      = lookup(lookup(var.branch_protections[count.index], "required_pull_request_reviews", null), "require_code_owner_reviews", null)
#    required_approving_review_count = lookup(lookup(var.branch_protections[count.index], "required_pull_request_reviews", null), "required_approving_review_count", null)
#  }
#
#  restrictions {
#    users = lookup(lookup(var.branch_protections[count.index], "restrictions", null), "users", null)
#    teams = lookup(lookup(var.branch_protections[count.index], "restrictions", null), "teams", null)
#  }
#}

# see https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_deploy_key
resource "github_repository_deploy_key" "main" {
  # see https://www.terraform.io/docs/language/meta-arguments/for_each.html
  for_each = {
    for key in var.deploy_keys :
    key.key => key
  }

  key        = each.value.key
  read_only  = each.value.read_only
  repository = github_repository.main.name
  title      = each.value.title
}

# see https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_collaborator
resource "github_repository_collaborator" "main" {
  # see https://www.terraform.io/docs/language/meta-arguments/for_each.html
  for_each = {
    for collaborator in var.repository_collaborators :
    collaborator.username => collaborator
  }

  repository                  = github_repository.main.name
  username                    = each.value.username
  permission                  = try(each.value.permission, "push")
  permission_diff_suppression = try(each.value.permission_diff_suppression, false)
}

# see https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_repository
resource "github_team_repository" "main" {
  # see https://www.terraform.io/docs/language/meta-arguments/for_each.html
  for_each = {
    for team in var.team_repository_teams :
    team.team_id => team
  }

  team_id    = each.value.team_id
  repository = github_repository.main.name
  permission = try(each.value.permission, "push")
}

# see https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label
resource "github_issue_label" "main" {
  # see https://www.terraform.io/docs/language/meta-arguments/for_each.html
  for_each = {
    for label in var.issue_labels :
    label.name => label
  }

  repository  = github_repository.main.name
  name        = each.value.name
  color       = each.value.color
  description = try(each.value.description, "")
}

# see https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_project
resource "github_repository_project" "main" {
  # see https://www.terraform.io/docs/language/meta-arguments/for_each.html
  for_each = {
    for project in var.projects :
    project.name => project
  }

  name       = each.value.name
  repository = github_repository.main.name
  body       = each.value.body

  depends_on = [
    github_repository.main
  ]
}

# see https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file
resource "github_repository_file" "main" {
  # see https://www.terraform.io/docs/language/meta-arguments/for_each.html
  for_each = {
    for file in var.files :
    file.file => file
  }

  repository = github_repository.main.name
  file       = each.value.file
  content    = each.value.content
  branch     = try(each.value.branch, var.default_branch)

  commit_author       = try(each.value.author, null)
  commit_email        = try(each.value.email, null)
  commit_message      = try(each.value.message, null)
  overwrite_on_create = try(each.value.overwrite_on_create, null)

  depends_on = [
    github_repository.main
  ]
}

# see https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_webhook
resource "github_repository_webhook" "main" {
  # see https://www.terraform.io/docs/language/meta-arguments/for_each.html
  for_each = {
    for hook in var.repository_webhooks :
    hook.configuration.url => hook
  }

  repository = github_repository.main.name
  active     = each.value.active
  events     = each.value.events

  configuration {
    url          = each.value.configuration.url
    content_type = each.value.configuration.content_type
    secret       = try(each.value.message, null)
    insecure_ssl = each.value.configuration.insecure_ssl
  }
}
