terraform {
  # see https://www.terraform.io/docs/language/settings/index.html#specifying-provider-requirements
  required_providers {
    # see https://registry.terraform.io/providers/integrations/github/6.2.1
    github = {
      source  = "integrations/github"
      version = ">= 6.2.1, < 7.0.0"
    }
  }

  # see https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
  required_version = ">= 1.3.0"
}
