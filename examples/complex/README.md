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
module "complex_example" {
  source  = "operatehappy/repository/github"
  version = "2.0.0"

  name               = "oh-demo-complex-example"
  description        = "Complex Repository Example"
  homepage_url       = "https://operatehappy.com/"
  private            = false
  has_issues         = true
  has_projects       = true
  has_wiki           = false
  allow_merge_commit = false
  allow_squash_merge = true
  allow_rebase_merge = false
  has_downloads      = false
  auto_init          = false
  default_branch     = "master"
  archived           = false
  topics             = ["topic-1", "topic-2"]
}
```

## Module Variables and Outputs

For a list of available variables and outputs, see the [Readme document](https://registry.terraform.io/modules/operatehappy/repository/github) on the Terraform Registry.

A copy of this document (as `README.md`) is also available on [GitHub](https://github.com/operatehappy/terraform-github-repository/blob/master/README.md#readme).
