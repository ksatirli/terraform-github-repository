# Example: `project`

> This is an example of a _project_ configuration of the [terraform-github-repository Module](https://registry.terraform.io/modules/operatehappy/repository/github)

## Table of Contents

- [Example: `project`](#example-project)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Module Variables and Outputs](#module-variables-and-outputs)

## Installation

For a list of installation instructions, see the [Readme document](https://registry.terraform.io/modules/operatehappy/repository/github) on the Terraform Registry.

## Usage

A _project_ configuration of the `terraform-github-repository` Module could look like this:

```hcl
module "project-example" {
  source  = "operatehappy/repository/github"
  version = "2.0.0"

  name    = "oh-demo-project-example"
  private = false // NOTE: private repositories require a paid subscription

  projects = [
    {
      name = "Internal Infrastructure"
      body = "Internal Infrastructure Project for Section 13"
    }
  ]
}
```

## Module Variables and Outputs

For a list of available variables and outputs, see the [Readme document](https://registry.terraform.io/modules/operatehappy/repository/github) on the Terraform Registry.

A copy of this document (as `README.md`) is also available on [GitHub](https://github.com/operatehappy/terraform-github-repository/blob/master/README.md#readme).
