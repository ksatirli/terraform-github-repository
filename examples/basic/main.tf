provider "github" {
  owner = "a-demo-organization"
}

module "basic_example" {
  source = "../../"

  name       = "basic-example"
  visibility = "public"
}
