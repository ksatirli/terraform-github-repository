# Example: `files`

> This is an example of a _files_ configuration of the [terraform-github-repository Module](https://registry.terraform.io/modules/operatehappy/repository/github)

## Table of Contents

- [Example: `files`](#example-files)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Module Variables and Outputs](#module-variables-and-outputs)

## Installation

For a list of installation instructions, see the [Readme document](https://registry.terraform.io/modules/operatehappy/repository/github) on the Terraform Registry.

## Usage

A _files_ configuration of the `terraform-github-repository` Module could look like this:

```hcl
module "files_example" {
  source  = "operatehappy/repository/github"
  version = "3.0.0"

  name    = "oh-demo-files-example"
  private = false

  files = [
    {
      file    = "Adds .gitignore",
      content = file("file-templates/.gitignore")
      }, {
      file    = "Adds .gitattributes",
      content = file("file-templates/.gitattributes")
    }
  ]
}
```

## Module Variables and Outputs

For a list of available variables and outputs, see the [Readme document](https://registry.terraform.io/modules/operatehappy/repository/github) on the Terraform Registry.

A copy of this document (as `README.md`) is also available on [GitHub](https://github.com/operatehappy/terraform-github-repository/blob/main/README.md#readme).
