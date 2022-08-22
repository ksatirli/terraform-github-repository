provider "github" {
  owner = "a-demo-organization"
}

module "pages_example" {
  source = "../.."

  name       = "oh-demo-pages-example"
  auto_init  = true
  visibility = "public"

  pages = {
    branch = "main",
    path   = "/"
  }
}
