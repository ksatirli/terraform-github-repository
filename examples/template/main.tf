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

module "template_example" {
  source = "../../"

  name       = "oh-demo-template-example"
  visibility = "public"

  template = {
    owner      = "TheYorkshireDev",
    repository = "application-template"
  }
}
