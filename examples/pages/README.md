# Example: `pages`

> This is an example of a _pages_ configuration of the [terraform-github-repository Module](https://registry.terraform.io/modules/operatehappy/repository/github)

## Table of Contents

- [Example: `pages`](#example-pages)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Module Variables and Outputs](#module-variables-and-outputs)

## Installation

For a list of installation instructions, see the [Readme document](https://registry.terraform.io/modules/operatehappy/repository/github) on the Terraform Registry.

## Usage

A _pages_ configuration of the `terraform-github-repository` Module could look like this:

**NOTE:** A template has been used to create the repository which contains content to show simple GitHub Pages website at `https://<Your Username>.github.io/oh-demo-pages-example/`

```hcl
module "pages_example" {
  source = "../.."

  name       = "oh-demo-pages-example"
  visibility = "public"

  pages = {
    branch = "main",
    path   = "/"
  }

  template = {
    owner      = "TheYorkshireDev",
    repository = "bootstrap-4-github-pages"
  }
}
```

## Module Variables and Outputs

For a list of available variables and outputs, see the [Readme document](https://registry.terraform.io/modules/operatehappy/repository/github) on the Terraform Registry.

A copy of this document (as `README.md`) is also available on [GitHub](https://github.com/operatehappy/terraform-github-repository/blob/main/README.md#readme).