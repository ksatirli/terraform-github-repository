variable "name" {
  type        = "string"
  description = "The name of the repository"
  default     = ""
}

variable "description" {
  type        = "string"
  description = "A description of the repository"
  default     = ""
}

variable "homepage_url" {
  type        = "string"
  description = "URL of a page describing the project"
  default     = ""
}

variable "private" {
  description = "Set to `true` to create a private repository"
  default     = true
}

variable "has_issues" {
  description = "Set to `true` to enable the Github Issues features on the repository"
  default     = true
}

variable "has_wiki" {
  description = "Set to `true` to enable the Github Wiki features on the repository"
  default     = true
}

variable "allow_merge_commit" {
  description = "Set to `false` to disable merge commits on the repository"
  default     = true
}

variable "allow_squash_merge" {
  description = "Set to `false` to disable squash merges on the repository"
  default     = true
}

variable "allow_rebase_merge" {
  description = "Set to `false` to disable rebase merges on the repository"
  default     = true
}

variable "has_downloads" {
  description = "Set to `true` to enable the (deprecated) downloads features on the repository"
  default     = false
}

variable "auto_init" {
  description = "Set to `true` to produce an initial commit in the repository"
  default     = true
}

variable "gitignore_template" {
  type        = "string"
  description = "Set to a template to use for the `.gitignore` file"
  default     = ""
}

variable "license_template" {
  type        = "string"
  description = "Set to a template to use for the license"
  default     = "apache-2.0"
}

variable "branch" {
  type        = "string"
  description = "The name of the default branch of the repository"
  default     = "master"
}

variable "enable_team_repository" {
  description = "Boolean to toggle team repository settings"
  default     = 0
}

variable "team_repository_team" {
  type        = "string"
  description = "The GitHub team ID"
  default     = ""
}

variable "team_repository_permission" {
  type        = "string"
  description = "The permissions of team members regarding the repository"
  default     = "pull"
}

variable "enable_branch_protection" {
  type        = "string"
  description = "Boolean to toggle branch protection settings. Only works when repository has been created"
  default     = 0
}

variable "enforce_admins" {
  description = "Boolean to toggle enforcement of status checks for administrators"
  default     = true
}

variable "req_status_checks_strict" {
  type = "string"

  description = "Boolean to toggle strictness of status checks"
  default     = false
}

variable "req_status_checks_context" {
  type        = "list"
  description = "List of status checks to require in order to merge into this branch"
  default     = []
}

variable "req_pr_reviews_dismiss_stale_reviews" {
  description = "Boolean to toggle dismissal of reviews when a new commit is pushed"
  default     = true
}

variable "req_pr_reviews_dismiss_stale_reviews" {
  description = "Boolean to toggle requiring review from designated code owner"
  default     = false
}

variable "req_pr_reviews_dismissal_users" {
  description = "The list of user logins with dismissal access"
  default     = []
}

variable "req_pr_reviews_dismissal_teams" {
  description = "The list of team slugs with dismissal access"
  default     = []
}

variable "restrictions_users" {
  description = "The list of user logins with push access"
  default     = []
}

variable "restrictions_teams" {
  description = "The list of team slugs with push access"
  default     = []
}
