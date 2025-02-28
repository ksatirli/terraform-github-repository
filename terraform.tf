terraform {
  # see https://developer.hashicorp.com/terraform/language/terraform#terraform-required_providers
  required_providers {
    # see https://registry.terraform.io/providers/integrations/github/6.2.1
    github = {
      source  = "integrations/github"
      version = ">= 6.2.1, < 7.0.0"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/terraform#terraform-required_providers
  required_version = ">= 1.3.0"
}
