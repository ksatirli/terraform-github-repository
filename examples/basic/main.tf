provider "github" {
  owner = "a-demo-organization"
}

module "basic_example" {
  source = "../../"

  name       = "oh-demo-basic-example"
  visibility = "public"
}
