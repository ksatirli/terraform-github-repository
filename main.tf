resource "github_repository" "this" {
  name         = var.name
  description  = var.description
  homepage_url = var.homepage_url

  # NOTE: `private` has been deprecated in favor of `visibility`
  visibility = var.visibility

  has_issues             = var.has_issues
  has_projects           = var.has_projects
  has_wiki               = var.has_wiki
  is_template            = var.is_template
  allow_merge_commit     = var.allow_merge_commit
  allow_squash_merge     = var.allow_squash_merge
  allow_rebase_merge     = var.allow_rebase_merge
  delete_branch_on_merge = var.delete_branch_on_merge
  has_downloads          = var.has_downloads
  auto_init              = var.auto_init
  gitignore_template     = var.gitignore_template
  license_template       = var.license_template

  # NOTE: `default_branch` has been deprecated in favor of a `github_branch_default` resource

  archived           = var.archived
  archive_on_destroy = var.archive_on_destroy

  dynamic "pages" {
    for_each = length(var.template) != 0 ? [var.template] : []

    content {
      source {
        branch = lookup(pages.value, "branch", var.default_branch)
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

resource "github_branch_default" "this" {
  repository = github_repository.this.name
  branch     = var.default_branch
}

resource "github_branch_protection_v3" "this" {
  count = length(var.branch_protections)

  repository             = github_repository.this.name
  branch                 = var.branch_protections[count.index].branch
  enforce_admins         = var.branch_protections[count.index].enforce_admins
  require_signed_commits = var.branch_protections[count.index].require_signed_commits

  required_status_checks {
    strict   = lookup(lookup(var.branch_protections[count.index], "required_status_checks", null), "strict", null)
    contexts = lookup(lookup(var.branch_protections[count.index], "required_status_checks", null), "contexts", null)
  }

  required_pull_request_reviews {
    dismiss_stale_reviews           = lookup(lookup(var.branch_protections[count.index], "required_pull_request_reviews", null), "dismiss_stale_reviews", null)
    dismissal_users                 = lookup(lookup(var.branch_protections[count.index], "required_pull_request_reviews", null), "dismissal_users", null)
    dismissal_teams                 = lookup(lookup(var.branch_protections[count.index], "required_pull_request_reviews", null), "dismissal_teams", null)
    require_code_owner_reviews      = lookup(lookup(var.branch_protections[count.index], "required_pull_request_reviews", null), "require_code_owner_reviews", null)
    required_approving_review_count = lookup(lookup(var.branch_protections[count.index], "required_pull_request_reviews", null), "required_approving_review_count", null)
  }

  restrictions {
    users = lookup(lookup(var.branch_protections[count.index], "restrictions", null), "users", null)
    teams = lookup(lookup(var.branch_protections[count.index], "restrictions", null), "teams", null)
  }
}

resource "github_repository_deploy_key" "this" {
  count = length(var.deploy_keys)

  key        = var.deploy_keys[count.index].key
  read_only  = var.deploy_keys[count.index].read_only
  repository = github_repository.this.name
  title      = var.deploy_keys[count.index].title
}

resource "github_repository_collaborator" "this" {
  count = length(var.repository_collaborators)

  repository                  = github_repository.this.name
  username                    = var.repository_collaborators[count.index].username
  permission                  = lookup(var.repository_collaborators[count.index], "permission", "push")
  permission_diff_suppression = lookup(var.repository_collaborators[count.index], "permission_diff_suppression", false)
}

resource "github_team_repository" "this" {
  count = length(var.team_repository_teams)

  team_id    = var.team_repository_teams[count.index].team_id
  repository = github_repository.this.name
  permission = lookup(var.team_repository_teams[count.index], "permission", "push")
}

resource "github_issue_label" "this" {
  count = length(var.issue_labels)

  repository  = github_repository.this.name
  name        = var.issue_labels[count.index].name
  color       = var.issue_labels[count.index].color
  description = lookup(var.issue_labels[count.index], "description", null)
}

resource "github_repository_project" "this" {
  count = length(var.projects)

  name       = var.projects[count.index].name
  repository = github_repository.this.name
  body       = var.projects[count.index].body
}

resource "github_repository_file" "this" {
  count = length(var.files)

  repository = github_repository.this.name
  file       = var.files[count.index].file
  content    = var.files[count.index].content
  branch     = lookup(var.files[count.index], "branch", "main")

  commit_author       = lookup(var.files[count.index], "author", null)
  commit_email        = lookup(var.files[count.index], "email", null)
  commit_message      = lookup(var.files[count.index], "message", null)
  overwrite_on_create = lookup(var.files[count.index], "overwrite_on_create", false)
}
