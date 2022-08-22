provider "github" {
  owner = "a-demo-organization"
}

module "simple_example" {
  source = "../../"

  name       = "oh-demo-simple-example"
  visibility = "public"
}
