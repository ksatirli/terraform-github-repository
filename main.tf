resource "github_repository" "repository" {
  name               = "${var.name}"
  description        = "${var.description}"
  homepage_url       = "${var.homepage_url}"
  private            = "${var.private}"
  has_issues         = "${var.has_issues}"
  has_wiki           = "${var.has_wiki}"
  has_projects       = "${var.has_projects}"
  allow_merge_commit = "${var.allow_merge_commit}"
  allow_squash_merge = "${var.allow_squash_merge}"
  allow_rebase_merge = "${var.allow_rebase_merge}"
  has_downloads      = "${var.has_downloads}"
  auto_init          = "${var.auto_init}"
  gitignore_template = "${var.gitignore_template}"
  license_template   = "${var.license_template}"
  topics             = "${var.topics}"
  archived           = "${var.archived}"
}

resource "github_team_repository" "team_repository" {
  count = "${var.enable_team_repository}"

  team_id    = "${var.team_repository_team}"
  repository = "${github_repository.repository.name}"
  permission = "${var.team_repository_permission}"
}

resource "github_branch_protection" "protected_branch" {
  count = "${var.enable_branch_protection}"

  repository     = "${github_repository.repository.name}"
  branch         = "${var.branch}"
  enforce_admins = "${var.enforce_admins}"

  required_status_checks {
    strict   = "${var.req_status_checks_strict}"
    contexts = ["${var.req_status_checks_context}"]
  }

  required_pull_request_reviews {
    dismiss_stale_reviews      = "${var.req_pr_reviews_dismiss_stale_reviews}"
    require_code_owner_reviews = "${var.req_pr_reviews_require_code_owner_reviews}"
    dismissal_users            = ["${var.req_pr_reviews_dismissal_users}"]
    dismissal_teams            = ["${var.req_pr_reviews_dismissal_teams}"]
  }

  restrictions {
    users = ["${var.restrictions_users}"]
    teams = ["${var.restrictions_teams}"]
  }
}
