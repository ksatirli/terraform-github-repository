provider "github" {
  owner = "a-demo-organization"
}

module "template_example" {
  source = "../.."

  name       = "oh-demo-template-example"
  visibility = "public"

  template = {
    owner      = "a-demo-organization",
    repository = "template-source"
  }
}
