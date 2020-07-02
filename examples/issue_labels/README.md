# Example: `issue-labels`

> This is an example of an _issue-labels_ configuration of the [terraform-github-repository Module](https://registry.terraform.io/modules/operatehappy/repository/github)

## Table of Contents

- [Example: `issue-labels`](#example-issue-labels)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Module Variables and Outputs](#module-variables-and-outputs)

## Installation

For a list of installation instructions, see the [Readme document](https://registry.terraform.io/modules/operatehappy/repository/github) on the Terraform Registry.

## Usage

A _issue-labels_ configuration of the `terraform-github-repository` Module could look like this:

```hcl
module "issue_labels_example" {
  source  = "operatehappy/repository/github"
  version = "2.0.0"

  name    = "oh-demo-issue-labels-example"
  private = false

  issue_labels = [
    {
      name        = "size/S"
      color       = "0075ca"
      description = "small change"
    },
    {
      name        = "size/M"
      color       = "0075ca"
      description = "medium change"
    },
    {
      name        = "size/L"
      color       = "0075ca"
      description = "medium change"
    }
  ]
}
```

## Module Variables and Outputs

For a list of available variables and outputs, see the [Readme document](https://registry.terraform.io/modules/operatehappy/repository/github) on the Terraform Registry.

A copy of this document (as `README.md`) is also available on [GitHub](https://github.com/operatehappy/terraform-github-repository/blob/main/README.md#readme).
