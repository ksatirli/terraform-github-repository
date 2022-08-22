provider "github" {
  owner = "a-demo-organization"
}

module "branch_protection_example" {
  source = "../../"

  name       = "oh-demo-branch-protection-example"
  visibility = "public"

  branch_protections = [
    {
      branch                 = "main"
      enforce_admins         = true
      require_signed_commits = true

      required_status_checks = {
        strict   = false
        contexts = ["ci/sentinel"]
      }

      required_pull_request_reviews = {
        dismiss_stale_reviews           = true
        dismissal_users                 = ["ksatirli"]
        dismissal_teams                 = []
        require_code_owner_reviews      = false,
        required_approving_review_count = null
      }

      restrictions = {
        users = ["ksatirli"]
        teams = []
      }
    }
  ]
}
