module "complex-example" {
  source  = "operatehappy/repository/github"
  version = "2.0.0"

  name    = "oh-demo-complex-example"
  private = false // NOTE: private repositories require a paid subscription

  branch_protections = [
    {
      branch                 = "master"
      enforce_admins         = true
      require_signed_commits = true

      required_status_checks = {
        strict   = false
        contexts = ["ci/sentinel"]
      }

      required_pull_request_reviews = {
        dismiss_stale_reviews           = true
        dismissal_users                 = ["operatehappy-bot"]
        dismissal_teams                 = []
        require_code_owner_reviews      = false,
        required_approving_review_count = null
      }

      restrictions = {
        users = ["operatehappy-bot"]
        teams = []
      }
    }
  ]
}
