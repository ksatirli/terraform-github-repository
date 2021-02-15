module "simple_example" {
  source  = "operatehappy/repository/github"
  version = "3.0.0"

  name       = "oh-demo-simple-example"
  visibility = "public"
}
