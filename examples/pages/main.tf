provider "github" {
  owner = "a-demo-organization"
}

module "pages_example" {
  source = "../.."

  name       = "pages-example"
  auto_init  = true
  visibility = "public"

  pages = {
    branch = "main",
    path   = "/"
  }
}
