terraform {
  # see https://developer.hashicorp.com/terraform/language/terraform#terraform-required_providers
  required_providers {
    # see https://registry.terraform.io/providers/integrations/github/6.5.0
    github = {
      source  = "integrations/github"
      version = "6.6.0"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/terraform#terraform-required_providers
  required_version = ">= 1.3.0"
}
