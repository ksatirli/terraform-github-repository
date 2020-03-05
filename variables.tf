variable "name" {
  type        = string
  description = "The name of the repository"
  default     = ""
}

variable "description" {
  type        = string
  description = "A description of the repository"
  default     = ""
}

variable "homepage_url" {
  type        = string
  description = "URL of a page describing the project"
  default     = ""
}

variable "private" {
  type        = bool
  description = "Set to `true` to create a private repository"
  default     = true
}

variable "has_issues" {
  type        = bool
  description = "Set to `true` to enable the Github Issues features on the repository"
  default     = true
}

variable "has_projects" {
  type        = bool
  description = "Set to `true` to enable the Github Projects features on the repository"
  default     = true
}

variable "has_wiki" {
  description = "Set to `true` to enable the Github Wiki features on the repository"
  default     = true
}

variable "allow_merge_commit" {
  type        = bool
  description = "Set to `false` to disable merge commits on the repository"
  default     = true
}

variable "allow_squash_merge" {
  type        = bool
  description = "Set to `false` to disable squash merges on the repository"
  default     = true
}

variable "allow_rebase_merge" {
  type        = bool
  description = "Set to `false` to disable rebase merges on the repository"
  default     = true
}

variable "has_downloads" {
  type        = bool
  description = "Set to `true` to enable the (deprecated) downloads features on the repository"
  default     = false
}

variable "auto_init" {
  type        = bool
  description = "Set to `true` to produce an initial commit in the repository"
  default     = false
}

variable "gitignore_template" {
  type        = string
  description = "Set a template to use for the `.gitignore` file"
  default     = ""
}

variable "license_template" {
  type        = string
  description = "Set to a template to use for the license"
  default     = ""
}

variable "default_branch" {
  type        = string
  description = "The name of the default branch of the repository"
  default     = "master"
}

variable "archived" {
  type        = bool
  description = "Set to `true` to mark this repository as archived"
  default     = false
}

variable "topics" {
  type        = list(string)
  description = "The list of topics of the repository"
  default     = []
}

variable "template" {
  type        = map(string)
  description = "Template repository to use to create this repository"
  default     = {}
}

variable "team_repository_teams" {
  // `team_repository_teams.permission` is optional and defaults to `push`
  type        = list(object({ team_id = string }))
  description = "List of Team Objects"
  default     = []
}

variable "repository_collaborators" {
  // `repository_collaborators.permission` is optional and defaults to `push`
  type        = list(object({ username = string }))
  description = "List of Collaborator Objects"
  default     = []
}

variable "enable_branch_protection" {
  type        = bool
  description = "Boolean to toggle branch protection settings. Only works when repository has been created"
  default     = false
}

variable "enforce_admins" {
  type        = bool
  description = "Boolean to toggle enforcement of status checks for administrators"
  default     = true
}

variable "req_status_checks_strict" {
  type        = bool
  description = "Boolean to toggle strictness of status checks"
  default     = false
}

variable "req_status_checks_context" {
  type        = list(string)
  description = "List of status checks to require in order to merge into this branch"
  default     = []
}

variable "req_pr_reviews_dismiss_stale_reviews" {
  type        = bool
  description = "Boolean to toggle dismissal of reviews when a new commit is pushed"
  default     = true
}

variable "req_pr_reviews_require_code_owner_reviews" {
  type        = bool
  description = "Boolean to toggle requiring review from designated code owner"
  default     = false
}

variable "req_pr_reviews_dismissal_users" {
  type        = list
  description = "The list of user logins with dismissal access"
  default     = []
}

variable "req_pr_reviews_dismissal_teams" {
  type        = list
  description = "The list of team slugs with dismissal access"
  default     = []
}

variable "restrictions_users" {
  type        = list
  description = "The list of user logins with push access"
  default     = []
}

variable "restrictions_teams" {
  type        = list
  description = "The list of team slugs with push access"
  default     = []
}

variable "deploy_keys" {
  type        = list(object({ title = string, key = string, read_only = bool }))
  description = "List of Deploy Key Objects"
  default     = []
}

variable "issue_labels" {
  // `issue_labels.description` is optional and defaults to `""`
  type        = list(object({ name = string, color = string }))
  description = "List of Issue Label Objects"
  default     = []
}
