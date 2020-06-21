module "issue-labels-example" {
  source  = "operatehappy/repository/github"
  version = "2.0.0"

  name    = "oh-demo-issue-labels-example"
  private = false

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
