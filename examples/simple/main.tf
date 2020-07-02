module "simple_example" {
  source  = "operatehappy/repository/github"
  version = "2.0.0"

  name    = "oh-demo-simple-example"
  private = false
}
