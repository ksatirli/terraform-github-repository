provider "github" {
  owner = "a-demo-organization"
}

module "pages_example" {
  source = "../.."

  name       = "oh-demo-pages-example"
  visibility = "public"

  pages = {
    branch = "main",
    path   = "/"
  }
}
