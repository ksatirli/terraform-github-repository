# Example: `project-columns`

> This is an example of a _project-columns_ configuration of the [terraform-github-repository Module](https://registry.terraform.io/modules/operatehappy/repository/github)

## Table of Contents

- [Example: `project-columns`](#example-project-columns)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Module Variables and Outputs](#module-variables-and-outputs)

## Installation

For a list of installation instructions, see the [Readme document](https://registry.terraform.io/modules/operatehappy/repository/github) on the Terraform Registry.

## Usage

A _project-columns_ configuration of the `terraform-github-repository` Module could look like this:

```hcl
module "project_column_example" {
  source  = "../.."

  name    = "oh-demo-project-example"
  private = false

  projects = [
    {
      name = "Providence Facility Infra"
      body = "Infrastructure issues for the Providence Facility"
      }, {
      name = "Providence Facility Frontend"
      body = "Frontend issues for the Providence Facility"
    }
  ]
}

resource "github_project_column" "todo" {
  count = length(module.project-column-example.project_ids)

  project_id = module.project-column-example.project_ids[count.index]
  name       = "To Do"
}

resource "github_project_column" "in_progress" {
  count = length(module.project-column-example.project_ids)

  project_id = module.project-column-example.project_ids[count.index]
  name       = "In Progress"
}

resource "github_project_column" "done" {
  count = length(module.project-column-example.project_ids)

  project_id = module.project-column-example.project_ids[count.index]
  name       = "Done"
}
```

[Project Columns](https://www.terraform.io/docs/providers/github/r/project_column.html) are a _child_ of [Repository Projects](https://www.terraform.io/docs/providers/github/r/repository_project.html) (as well as [Organization Projects](https://www.terraform.io/docs/providers/github/r/organization_project.html)).

Due to the nature of the two resources - one requiring an iterator for `n` Projects and the other requiring an iterator for `n` Project Columns, there is no module built-in support for creating columns.

In spite of that, the module output for `project_ids` is used to iterate over, with each Project Column being added as a non-module-managed resource.

## Module Variables and Outputs

For a list of available variables and outputs, see the [Readme document](https://registry.terraform.io/modules/operatehappy/repository/github) on the Terraform Registry.

A copy of this document (as `README.md`) is also available on [GitHub](https://github.com/operatehappy/terraform-github-repository/blob/master/README.md#readme).
