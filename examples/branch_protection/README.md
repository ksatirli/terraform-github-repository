# Example: `branch_protection`

> This is an example of a _branch-protection_ configuration of the [terraform-github-repository Module](https://registry.terraform.io/modules/operatehappy/repository/github)

## Table of Contents

- [Example: `branch_protection`](#example-branch_protection)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Module Variables and Outputs](#module-variables-and-outputs)

## Installation

For a list of installation instructions, see the [Readme document](https://registry.terraform.io/modules/operatehappy/repository/github) on the Terraform Registry.

## Usage

A _branch-protection_ configuration of the `terraform-github-repository` Module could look like this:

```hcl
module "branch_protection_example" {
  source  = "../../"

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
```

## Module Variables and Outputs

For a list of available variables and outputs, see the [Readme document](https://registry.terraform.io/modules/operatehappy/repository/github) on the Terraform Registry.

A copy of this document (as `README.md`) is also available on [GitHub](https://github.com/operatehappy/terraform-github-repository/blob/main/README.md#readme).

<!-- BEGIN_TF_DOCS -->
### Inputs

No inputs.

### Outputs

No outputs.
<!-- END_TF_DOCS -->