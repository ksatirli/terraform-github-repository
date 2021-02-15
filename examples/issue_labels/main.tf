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

module "issue_labels_example" {
  source = "../.."

  name       = "oh-demo-issue-labels-example"
  visibility = "public"

  issue_labels = [
    {
      name        = "size/S"
      color       = "0075ca"
      description = "small change"
    },
    {
      name        = "size/M"
      color       = "0075ca"
      description = "medium change"
    },
    {
      name        = "size/L"
      color       = "0075ca"
      description = "medium change"
    }
  ]
}
