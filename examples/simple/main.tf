terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "4.4.0"
    }
  }
}

provider "github" {
  owner = "a-demo-organization"
}

module "simple_example" {
  source = "../../"

  name       = "oh-demo-simple-example"
  visibility = "public"
}
