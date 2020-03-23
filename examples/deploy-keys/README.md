# Example: `deploy-keys`

> This is an example of a _deploy-keys_ configuration of the [terraform-github-repository Module](https://registry.terraform.io/modules/operatehappy/repository/github)

## Table of Contents

- [Example: `deploy-keys`](#example-deploy-keys)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Module Variables and Outputs](#module-variables-and-outputs)

## Installation

For a list of installation instructions, see the [Readme document](https://registry.terraform.io/modules/operatehappy/repository/github) on the Terraform Registry.

## Usage

A _deploy-keys_ configuration of the `terraform-github-repository` Module could look like this:

```hcl
module "deploy-keys-example" {
  source  = "operatehappy/repository/github"
  version = "2.0.0"

  name    = "oh-demo-deploy-keys-example"
  private = false // NOTE: private repositories require a paid subscription

  deploy_keys = [
    {
      title     = "Terraform-managed deploy key"
      key       = "ssh-rsa AAA...DpQ== github@example.com"
      read_only = true
    }
  ]
}
```

## Module Variables and Outputs

For a list of available variables and outputs, see the [Readme document](https://registry.terraform.io/modules/operatehappy/repository/github) on the Terraform Registry.

A copy of this document (as `README.md`) is also available on [GitHub](https://github.com/operatehappy/terraform-github-repository/blob/master/README.md#readme).
