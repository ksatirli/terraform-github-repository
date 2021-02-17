# Example: `simple`

> This is an example of a _simple_ configuration of the [terraform-github-repository Module](https://registry.terraform.io/modules/operatehappy/repository/github)

## Table of Contents

- [Example: `simple`](#example-simple)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Module Variables and Outputs](#module-variables-and-outputs)

## Installation

For a list of installation instructions, see the [Readme document](https://registry.terraform.io/modules/operatehappy/repository/github) on the Terraform Registry.

## Usage

A _simple_ configuration of the `terraform-github-repository` Module could look like this:

```hcl
module "simple_example" {
  source  = "../.."

  name    = "oh-demo-simple-example"
  private = false
}
```

## Module Variables and Outputs

For a list of available variables and outputs, see the [Readme document](https://registry.terraform.io/modules/operatehappy/repository/github) on the Terraform Registry.

A copy of this document (as `README.md`) is also available on [GitHub](https://github.com/operatehappy/terraform-github-repository/blob/main/README.md#readme).
