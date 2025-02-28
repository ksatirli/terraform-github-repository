module "source_template_example" {
  source = "../../"

  name        = "template-source"
  auto_init   = true
  is_template = true
  visibility  = "public"
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
