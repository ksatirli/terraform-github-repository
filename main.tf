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

resource "github_team_repository" "team-repository" {
  count = length(var.team_repository_teams)

  team_id    = var.team_repository_teams[count.index].team_id
  repository = github_repository.repository.name
  permission = var.team_repository_teams[count.index].permission
}

resource "github_branch_protection" "protected-branch" {
  count = var.enable_branch_protection

  repository     = var.name
  branch         = var.branch
  enforce_admins = var.enforce_admins

  required_status_checks {
    strict   = var.req_status_checks_strict
    contexts = [var.req_status_checks_context]
  }

  required_pull_request_reviews {
    dismiss_stale_reviews      = var.req_pr_reviews_dismiss_stale_reviews
    require_code_owner_reviews = var.req_pr_reviews_require_code_owner_reviews
    dismissal_users            = [var.req_pr_reviews_dismissal_users]
    dismissal_teams            = [var.req_pr_reviews_dismissal_teams]
  }

  restrictions {
    users = [var.restrictions_users]
    teams = [var.restrictions_teams]
  }
}

resource "github_issue_label" "issue_label" {
  count       = length(var.issue_labels)
  repository  = github_repository.repository.name
  name        = var.issue_labels[count.index].name
  color       = var.issue_labels[count.index].color
  description = lookup(var.issue_labels[count.index], "description", null)
}
