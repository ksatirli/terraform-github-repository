provider "github" {
  owner = "a-demo-organization"
}

module "template_example" {
  source = "../.."

  name       = "template-example"
  visibility = "public"

  template = {
    owner      = "a-demo-organization",
    repository = "template-source"
  }
}
