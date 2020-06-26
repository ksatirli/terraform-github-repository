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
module "deploy_keys_example" {
  source  = "operatehappy/repository/github"
  version = "2.0.0"

  name    = "oh-demo-deploy-keys-example"
  private = false

  deploy_keys = [
    {
      title     = "Terraform-managed deploy key"
      key       = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC52PyMU5JBZ0nWb5qjNt/nYHmT0AMHfjTaajgS7oM7puiJaT7ZGW6sO84h87RIrucNWcbfAlW3COieFqNNnXrCjQ2D2UqS0VaN7N7d+5KAwebCjYZHnViFBADZ7ed9069OSnIZNJ4WQ0Rb6M29bQAi1kq3+5zoLr6ukxYi5xFUTXMyGBp7DBOi8FuVgjoTMDHrvUvu75Q7J6kNClQq++m/OUuq4Q8i6mQRdY6psQopfxux9r2FHZK4BhYS4+5NjLb/FK2GG+sJFIkmxZnIkgX6fGsn6d9YO3HpzoKDyfHi0XmeN5TCyfbGiq/g/7FxIHwFllG3UgXJeBP1NmTt52VqTKD1ikaHXQAjfEuMVBoVb82T+1p04cUP23WSiEMQsdFFQ2jtynCXAE3j2+EMqRpAgphn2rP7nLtwwktyTUqb3QghFaKIdSGnes6MDyqFvYsQzv5TDwyyDjrR7uuVydGc2xcktr9IFVTnZsCG0DGUwbBM/0oIElC25bAvYB5EeXBMQ2MssLMAD6hoC5JOjGjn6ZcKRRiveTpXfiZmedXrjS9vzuQUIpWrjxKSkR1kreFDz4VHRvPWFRGcxU2SFv/zLewk3uwKdEx3k71D1PkyINroVDeTx4SV2HzofxlQEnw/h006TkBLZX1BoS6eoTtxEkul9qvtolhsL+7KoqHDpQ== github@example.com"
      read_only = true
    }
  ]
}
```

## Module Variables and Outputs

For a list of available variables and outputs, see the [Readme document](https://registry.terraform.io/modules/operatehappy/repository/github) on the Terraform Registry.

A copy of this document (as `README.md`) is also available on [GitHub](https://github.com/operatehappy/terraform-github-repository/blob/main/README.md#readme).
