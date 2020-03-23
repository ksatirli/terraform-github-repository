module "complex-example" {
  source  = "operatehappy/repository/github"
  version = "2.0.0"

  name               = "oh-demo-complex-example"
  description        = "Complex Repository Example"
  homepage_url       = "https://operatehappy.com/"
  private            = false // NOTE: private repositories require a paid subscription
  has_issues         = true
  has_projects       = true
  has_wiki           = false
  allow_merge_commit = false
  allow_squash_merge = true
  allow_rebase_merge = false
  has_downloads      = false
  auto_init          = false
  default_branch     = "master"
  archived           = false
  topics             = ["topic-1", "topic-2"]
}
