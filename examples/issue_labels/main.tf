module "issue_labels_example" {
  source  = "operatehappy/repository/github"
  version = "3.0.0"

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
