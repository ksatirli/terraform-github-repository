module "simple-example" {
  source  = "operatehappy/repository/github"
  version = "2.0.0"

  name    = "oh-demo-simple-example"
  private = false // NOTE: private repositories require a paid subscription
}
