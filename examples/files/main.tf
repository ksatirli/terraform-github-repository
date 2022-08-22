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

module "files_example" {
  source = "../.."

  name       = "oh-demo-files-example"
  visibility = "public"

  files = [
    {
      file    = ".gitignore",
      content = file("../../.gitignore")
      }, {
      file    = "LICENSE",
      content = file("../../LICENSE")
    }
  ]
}
