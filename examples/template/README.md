# Example: `template`

> This is an example of a _template_ configuration of the [terraform-github-repository Module](https://registry.terraform.io/modules/operatehappy/repository/github)

## Table of Contents

- [Example: `template`](#example-template)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Module Variables and Outputs](#module-variables-and-outputs)

## Installation

For a list of installation instructions, see the [Readme document](https://registry.terraform.io/modules/operatehappy/repository/github) on the Terraform Registry.

## Usage

A _template_ configuration of the `terraform-github-repository` Module could look like this:

```hcl
module "template_example" {
  source = "../.."

  name       = "oh-demo-template-example"
  visibility = "public"

  template = {
    owner      = "a-demo-organization",
    repository = "template-source"
  }
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
