# Example: `webhook`

> This is an example of a _webhook_ configuration of the [terraform-github-repository Module](https://registry.terraform.io/modules/operatehappy/repository/github)

## Table of Contents

- [Exexample-webhook`](#example-webhook)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Module Variables and Outputs](#module-variables-and-outputs)

## Installation

For a list of installation instructions, see the [Readme document](https://registry.terraform.io/modules/operatehappy/repository/github) on the Terraform Registry.

## Usage

A _webhook_ configuration of the `terraform-github-repository` Module could look like this:

```hcl
module "webhook_example" {
  source = "../.."

  name       = "oh-demo-webhook-example"
  visibility = "public"

  repository_webhooks = [{
    active = true
    events = [
      "issues"
    ]

    configuration = {
      url          = "https://example.com/"
      content_type = "json"
      secret       = "AW96B6"
      insecure_ssl = false
    }
  }]
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
