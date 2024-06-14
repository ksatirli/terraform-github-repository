module "complex_example" {
  source = "../.."

  name               = "complex-example"
  description        = "Complex Repository Example"
  homepage_url       = "https://github.com/ksatirli"
  visibility         = "private"
  has_issues         = true
  has_projects       = true
  has_wiki           = false
  allow_merge_commit = false
  allow_squash_merge = true
  allow_rebase_merge = false
  has_downloads      = false
  auto_init          = false
  default_branch     = "main"
  archived           = false

  topics = [
    "topic-1",
    "topic-2"
  ]
}
