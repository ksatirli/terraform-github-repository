# Example: `complex`

> This is an example of a _complex_ configuration of the [terraform-github-repository Module](https://registry.terraform.io/modules/operatehappy/repository/github)

## Table of Contents

- [Example: `complex`](#example-complex)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Module Variables and Outputs](#module-variables-and-outputs)

## Installation

For a list of installation instructions, see the [Readme document](https://registry.terraform.io/modules/operatehappy/repository/github) on the Terraform Registry.

## Usage

A _complex_ configuration of the `terraform-github-repository` Module could look like this:

```hcl
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
```

## Module Variables and Outputs

For a list of available variables and outputs, see the [Readme document](https://registry.terraform.io/modules/operatehappy/repository/github) on the Terraform Registry.

A copy of this document (as `README.md`) is also available on [GitHub](https://github.com/operatehappy/terraform-github-repository/blob/master/README.md#readme).
