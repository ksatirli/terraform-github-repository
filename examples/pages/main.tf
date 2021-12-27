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
