resource "github_repository" "repository" {
  name               = var.name
  description        = var.description
  homepage_url       = var.homepage_url
  private            = var.private
  has_issues         = var.has_issues
  has_projects       = var.has_projects
  has_wiki           = var.has_wiki
  allow_merge_commit = var.allow_merge_commit
  allow_squash_merge = var.allow_squash_merge
  allow_rebase_merge = var.allow_rebase_merge
  has_downloads      = var.has_downloads
  auto_init          = var.auto_init
  gitignore_template = var.gitignore_template
  license_template   = var.license_template
  default_branch     = var.default_branch
  archived           = var.archived
  topics             = var.topics

  dynamic "template" {
    for_each = length(var.template) != 0 ? [var.template] : []

    content {
      owner      = lookup(template.value, "owner", null)
      repository = lookup(template.value, "repository", null)
    }
  }
}

resource "github_branch_protection" "branch_protection" {
  count = length(var.branch_protections)

  repository             = github_repository.repository.name
  branch                 = var.branch_protections[count.index].branch
  enforce_admins         = var.branch_protections[count.index].enforce_admins
  require_signed_commits = var.branch_protections[count.index].require_signed_commits

  required_status_checks {
    strict   = lookup(lookup(var.branch_protections[count.index], "required_status_checks", null), "strict", null)
    contexts = lookup(lookup(var.branch_protections[count.index], "required_status_checks", null), "contexts", null)
  }

  required_pull_request_reviews {
    dismiss_stale_reviews      = lookup(lookup(var.branch_protections[count.index], "required_pull_request_reviews", null), "dismiss_stale_reviews", null)
    dismissal_users            = lookup(lookup(var.branch_protections[count.index], "required_pull_request_reviews", null), "dismissal_users", null)
    dismissal_teams            = lookup(lookup(var.branch_protections[count.index], "required_pull_request_reviews", null), "dismissal_teams", null)
    require_code_owner_reviews = lookup(lookup(var.branch_protections[count.index], "required_pull_request_reviews", null), "require_code_owner_reviews", null)
    required_approving_review_count = lookup(lookup(var.branch_protections[count.index], "required_pull_request_reviews", null), "required_approving_review_count", null)
  }

  restrictions {
    users = lookup(lookup(var.branch_protections[count.index], "restrictions", null), "users", null)
    teams = lookup(lookup(var.branch_protections[count.index], "restrictions", null), "teams", null)
  }
}

// TODO: add support for https://www.terraform.io/docs/providers/github/r/repository_webhook.html

resource "github_repository_deploy_key" "deploy_key" {
  count = length(var.deploy_keys)

  title      = var.deploy_keys[count.index].title
  repository = github_repository.repository.name
  key        = var.deploy_keys[count.index].key
  read_only  = var.deploy_keys[count.index].read_only
}

resource "github_repository_collaborator" "collaborator" {
  count = length(var.repository_collaborators)

  repository = github_repository.repository.name
  username   = var.repository_collaborators[count.index].username
  permission = lookup(var.repository_collaborators[count.index], "permission", "push")
}

resource "github_team_repository" "team_repository" {
  count = length(var.team_repository_teams)

  team_id    = var.team_repository_teams[count.index].team_id
  repository = github_repository.repository.name
  permission = lookup(var.team_repository_teams[count.index], "permission", "push")
}

resource "github_issue_label" "issue_label" {
  count       = length(var.issue_labels)
  repository  = github_repository.repository.name
  name        = var.issue_labels[count.index].name
  color       = var.issue_labels[count.index].color
  description = lookup(var.issue_labels[count.index], "description", null)
}

// TODO: add support for `github_repository_project`
